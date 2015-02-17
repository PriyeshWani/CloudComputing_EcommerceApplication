using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProceedtoCheckout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserFirstName"] != null)
        {
            user.Text = HttpContext.Current.Session["UserFirstName"].ToString().Trim();
            PHSignin.Visible = false;
        }
        else
        {
            PHCart.Visible = false;
            PHUser.Visible = false;
        }


        GetShoppingCart();
        
        
        
        if (HttpContext.Current.Session["CartItemsCount"] != null)
             badge.Text = HttpContext.Current.Session["CartItemsCount"].ToString();

    }

    private void CheckAvailabilityandBlockProducts()
    {
        DataTable dt = new DataTable();
        string cartItems = HttpContext.Current.Session["CartItems"].ToString();
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@productIdList", cartItems);
        List<string> lstCartItems = new List<string>();
        lstCartItems = cartItems.Split(',').ToList();
        dt = new Database().ExecuteStoredProc("CheckAvailabilityandBlockProducts", parameters);
        var xx = lstCartItems.GroupBy(x => x);
        var ss = xx.Count();
        if (dt.Rows.Count != lstCartItems.GroupBy(x => x).Count())
        {
            AvailabiltyMessge.Text = "<span style=\"color:red;\">We are sorry! Some of the products you selected are no longer available.<br/> Your shopping cart has been updated. Please confirm order once again.</span>";
        }
        else
            ConfirmOrder(cartItems);
    }

    private void ConfirmOrder(string cartItems)
    {
        string shippinAddress = string.Empty;
        string userId = string.Empty;
        if (!string.IsNullOrEmpty(address.Text))
        {
            shippinAddress = address.Text;
        }
        if (!string.IsNullOrEmpty(HttpContext.Current.Session["UserId"].ToString()))
        {
            userId = HttpContext.Current.Session["UserId"].ToString();
        }
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@productList", cartItems);
        parameters.Add("@shippingAddress", shippinAddress);
        parameters.Add("@userId", userId);
        DataTable results = new Database().ExecuteStoredProc("CreateOrder", parameters);
        if(results.Rows.Count > 0)
            Response.Redirect(string.Format("Invoice.aspx?orderId={0}",results.Rows[0][0]));
    }

    private void GetShoppingCart()
    {
        string cartItems = string.Empty;
        if (HttpContext.Current.Session["CartItems"] == null)
        {
            CartDetails.Text = "Ooops! Your shopping cart is empty.";
        }
        else
        {
            cartItems = HttpContext.Current.Session["CartItems"].ToString();
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("@productIdList", cartItems);
            List<string> lstCartItems = new List<string>();
            lstCartItems = cartItems.Split(',').ToList();
            DataTable results = new Database().ExecuteStoredProc("GetCartItemDetails", parameters);
            if (results.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(Page.Request.QueryString["removeid"]))
                {
                    var rows = (from x in results.AsEnumerable()
                                where x.Field<int>("ProductID") != Convert.ToInt32(Page.Request.QueryString["removeid"])
                                select x);
                    if (rows.Count() == 0)
                    {
                        CartDetails.Text = "Ooops! Your shopping cart is empty.";
                        results = new DataTable();
                    }
                    else
                        results = rows.CopyToDataTable();
                    cartItems = string.Join(",", (from x in cartItems.Split(',').ToArray()
                                                  where x != Page.Request.QueryString["removeid"]
                                                  select x.ToString()).ToArray());
                    HttpContext.Current.Session["CartItems"] = cartItems;
                    int cartCount = 0;
                    if (!string.IsNullOrEmpty(cartItems))
                        cartCount = cartItems.Split(',').ToArray().Count();
                    HttpContext.Current.Session["CartItemsCount"] = cartCount;
                }
                if (results.Rows.Count > 0)
                {
                    string CartList = string.Empty;
                    CartList = @" <table class=""table"">";
                    CartList += @"<tr>";
                    CartList += @"<th>"; CartList += @"ProductName"; CartList += @"</th>";
                    CartList += @"<th>"; CartList += @"ProductImage"; CartList += @"</th>";
                    CartList += @"<th>"; CartList += @"Quantity"; CartList += @"</th>";
                    CartList += @"<th>"; CartList += @"Price"; CartList += @"</th>";
                    CartList += @"<th>"; CartList += @"Action"; CartList += @"</th>";
                    CartList += @"</tr>";
                    int totalPrice = 0;
                    foreach (DataRow dr in results.Rows)
                    {
                        CartList += @"<tr>";

                        //name
                        CartList += @"<td>";
                        CartList += string.Format(@" <h4>{0}</h4>", dr["ProductName"]);
                        CartList += @"</td>";
                        //image
                        CartList += @"<td>";
                        CartList += string.Format(@"<a href=""#"" class=""thumbnail"">
                    <img src=""images/{0}"" alt=""NA"" height=75 width=75/><br/>
                </a>", dr["ImageName"]);
                        CartList += @"</td>";
                        //quantity
                        CartList += @"<td>";
                        int quantity = (from x in lstCartItems where x == dr["ProductId"].ToString() select x).Count();
                        CartList += string.Format(@" <h4>{0}</h4>", quantity);
                        CartList += @"</td>";
                        //total price
                        CartList += @"<td>";
                        CartList += string.Format(@" <h4>{0}</h4>", quantity * Convert.ToInt32(dr["Price"]));
                        totalPrice += quantity * Convert.ToInt32(dr["Price"]);
                        CartList += @"</td>";

                        CartList += @"<td>";
                        CartList += string.Format(@" <a href=""ProceedtoCheckout.aspx?removeId={0}"" class=""btn btn-success"">Remove</a>", dr["ProductId"].ToString());

                        CartList += @"</td>";

                        CartList += @"</tr>";
                    }

                    CartList += @"<tr>";
                    CartList += @"<td colspan=""3"">";
                    CartList += string.Format(@"<center><h4><b>Total Price</b></h4></center>");

                    CartList += @"</td>";
                    CartList += @"<td colspan=""2"">";
                    CartList += string.Format(@" <h4>{0}</h4>", totalPrice);

                    CartList += @"</td>";
                    CartList += @"</tr>";
                    CartList += @"</table>";
                    CartDetails.Text = CartList;
                }
            }
        }

    }
    protected void MakePayment_Click(object sender, EventArgs e)
    {
        CheckAvailabilityandBlockProducts();
    }
}