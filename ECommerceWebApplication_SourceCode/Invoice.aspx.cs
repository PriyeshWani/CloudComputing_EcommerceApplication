using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoice : System.Web.UI.Page
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


        CreateInvoice();

        HttpContext.Current.Session["CartItems"] = "";
        HttpContext.Current.Session["CartItemsCount"] = 0;
        badge.Text = HttpContext.Current.Session["CartItemsCount"].ToString();

    }

    private void CreateInvoice()
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@orderId", Page.Request.QueryString["orderId"].ToString());
        DataTable results = new Database().ExecuteStoredProc("GetOrderDetails", parameters);

        parameters = new Dictionary<string, string>();
        parameters.Add("@productIdList", results.Rows[0]["ProductList"].ToString());
        DataTable products = new Database().ExecuteStoredProc("GetCartItemDetails", parameters);
        
        #region 
        string productList = string.Empty;
        productList = @" <table class=""table"">";
        productList += @"<tr>";
        productList += @"<th>"; productList += @"ProductName"; productList += @"</th>";
        productList += @"<th>"; productList += @"ProductImage"; productList += @"</th>";
        productList += @"<th>"; productList += @"Quantity"; productList += @"</th>";
        productList += @"<th>"; productList += @"Price($)"; productList += @"</th>";
        productList += @"</tr>";
        int totalPrice = 0;
        List<string> lstCartItems = new List<string>();
        lstCartItems = results.Rows[0]["ProductList"].ToString().Split(',').ToList();
        foreach (DataRow dr in products.Rows)
        {
            productList += @"<tr>";

            //name
            productList += @"<td>";
            productList += string.Format(@" <h4>{0}</h4>", dr["ProductName"]);
            productList += @"</td>";
            //image
            productList += @"<td>";
            productList += string.Format(@"<a href=""#"" class=""thumbnail"">
                    <img src=""images/{0}"" alt=""NA"" height=75 width=75/><br/>
                </a>", dr["ImageName"]);
            productList += @"</td>";
            //quantity
            productList += @"<td>";
            int quantity = (from x in lstCartItems where x == dr["ProductId"].ToString() select x).Count();
            productList += string.Format(@" <h4>{0}</h4>", quantity);
            productList += @"</td>";
            //total price
            productList += @"<td>";
            productList += string.Format(@" <h4>{0}</h4>", quantity * Convert.ToInt32(dr["Price"]));
            totalPrice += quantity * Convert.ToInt32(dr["Price"]);
            productList += @"</td>";

         
            productList += @"</tr>";
        }

        productList += @"<tr>";
        productList += @"<td colspan=""3"">";
        productList += string.Format(@"<center><h4><b>Total Price</b></h4></center>");

        productList += @"</td>";
        productList += @"<td colspan=""2"">";
        productList += string.Format(@" <h4><b>{0}</b></h4>", totalPrice);

        productList += @"</td>";
        productList += @"</tr>";
        productList += @"</table>";
        #endregion

        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("<span style=font-size:24px><b>Order Details</b></span>");
        sb.AppendFormat("<br/>");
        sb.AppendFormat("<br/>");

        sb.AppendFormat("<table>");
            sb.AppendFormat("<tr>");
                sb.AppendFormat("<td>");
                sb.AppendFormat("<b>Tracking Id:</b> ");
                sb.AppendFormat("</td>");
                sb.AppendFormat("<td>");
                    sb.AppendFormat("{0}", results.Rows[0]["OrderId"].ToString());
                sb.AppendFormat("</td>");
            sb.AppendFormat("</tr>");
            sb.AppendFormat("<tr>");
                sb.AppendFormat("<td>");
                sb.AppendFormat("<b>Name:</b> ");
                sb.AppendFormat("</td>");
                sb.AppendFormat("<td>");
                    sb.AppendFormat("{0}", results.Rows[0]["Name"].ToString());
                sb.AppendFormat("</td>");
            sb.AppendFormat("</tr>");
            sb.AppendFormat("<tr>");
                sb.AppendFormat("<td>");
                sb.AppendFormat("<b>Shipping Address:</b> "); 
                sb.AppendFormat("</td>");
                sb.AppendFormat("<td>");
                    sb.AppendFormat("{0}", results.Rows[0]["ShippingAddress"].ToString());
                sb.AppendFormat("</td>");
            sb.AppendFormat("</tr>");
            sb.AppendFormat("<tr>");
                sb.AppendFormat("<td>");
                sb.AppendFormat("<b>Estimated Shipping Date:</b> ");
                sb.AppendFormat("</td>");
                sb.AppendFormat("<td>");
                sb.AppendFormat("{0}", DateTime.Now.AddDays(7).ToShortDateString());
                sb.AppendFormat("</td>");
            sb.AppendFormat("</tr>");
        sb.AppendFormat("</table>");

        InvoiceMsg.Text = sb.ToString();

        ProductList.Text = productList;
           
    }
}