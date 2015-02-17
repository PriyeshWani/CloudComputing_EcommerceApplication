using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    List<string> lstBrand = new List<string> { "EPIPHONE", "DEF", "XYZ" };
    List<string> lstPriceRange = new List<string> { "<1000", "<2500", "<5000" };
       
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ChkBxLstBrand.DataSource = lstBrand;
            ChkBxLstBrand.DataBind();
            RDBLstPrice.DataSource = lstPriceRange;
            RDBLstPrice.DataBind();
        }
        
        if (Page.Request.QueryString["userid"] == "-1")
        {
            HttpContext.Current.Session.Clear();
        }

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

        if (!string.IsNullOrEmpty(Page.Request.QueryString["productId"]))
        {
            string cartItems = string.Empty;
            if (HttpContext.Current.Session["CartItems"] != null)
            {
                cartItems = HttpContext.Current.Session["CartItems"].ToString();
                cartItems += "," + Page.Request.QueryString["productId"].ToString();
                HttpContext.Current.Session["CartItems"] = cartItems;
                HttpContext.Current.Session["CartItemsCount"] = Convert.ToInt32(HttpContext.Current.Session["CartItemsCount"]) + 1;
            }
            else
            {
                cartItems = Page.Request.QueryString["productId"].ToString();
                HttpContext.Current.Session["CartItems"] = cartItems;
                HttpContext.Current.Session["CartItemsCount"] = 1;
            }
        }

        if (HttpContext.Current.Session["CartItemsCount"] != null)
            badge.Text = HttpContext.Current.Session["CartItemsCount"].ToString();

        ProductList.Text = GetProductDetails();
    }

    public string GetProductDetails()
    {
        string selectedBrands = string.Empty;
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        if (string.IsNullOrEmpty(RDBLstPrice.SelectedValue))
            parameters.Add("@price", null);
        else
            parameters.Add("@price",RDBLstPrice.SelectedValue.Replace("<","").Trim());
        if (string.IsNullOrEmpty(string.Join(",", (from item in ChkBxLstBrand.Items.Cast<ListItem>() where item.Selected select item.Value).ToArray())))
            parameters.Add("@Brand", null);
        else
        {
            parameters.Add("@Brand", string.Join(",", (from item in ChkBxLstBrand.Items.Cast<ListItem>() where item.Selected select item.Value).ToArray()));
        }
        DataTable results = new Database().ExecuteStoredProc("GetProductList", parameters);
        string products = string.Empty;
        foreach (DataRow dr in results.Rows)
        {
            products += string.Format(@"
 <div class=""col-md-3"">
                <h3>{0}</h3>
                <a href=""#"" class=""thumbnail"">
                    <img src=""images/{1}"" alt=""NA"" /><br/>
                </a>
                <p>Price: ${2}</p>
                <p><a class=""btn btn-success"" href=""Home.aspx?productId={3}"" >Add to Cart</a></p>
                <p><a class=""btn btn-success"" href=""ViewProductDetails.aspx?productId={3}"" >View details &raquo;</a></p>
            </div>
", dr["ProductName"],dr["ImageName"],dr["Price"],dr["ProductID"]);
        }
        return products;
    }
    protected void LinkButton_Click(object sender, EventArgs e)
    {

    }
}