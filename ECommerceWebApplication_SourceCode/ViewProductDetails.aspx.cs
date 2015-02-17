using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProductDetails : System.Web.UI.Page
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

        if (!string.IsNullOrEmpty(Page.Request.QueryString["productId"]) && Page.Request.QueryString["addtoCart"]=="true")
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

        ProductDetails.Text = GetProductDetails();

    }

    public string GetProductDetails()
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@productId", Page.Request.QueryString["productId"]);
        DataTable results = new Database().ExecuteStoredProc("GetProductDetails", parameters);
        string details = string.Empty;
        if (results.Rows.Count > 0)
        {
            details = string.Format(@"      
<div class=""col-lg-10"">
    <div class=""col-md-6"">
        <h3>{0}</h3>
        <a href=""#"" class=""img-rounded"">
             <img src=""images/{1}"" alt=""NA"" align=""center"" height=""350"" width=""350""><br/>
        </a>
    </div>
    <div class=""col-md-6"">
        <h3>Product Description</h3>
        <p>{3}</p>
        <p>Price: ${2}</p>
        <p><a class=""btn btn-success"" href=""ViewProductDetails.aspx?productId={4}&addtoCart=true"" >Add to Cart</a></p>
    </div>
</div>", results.Rows[0]["ProductName"], results.Rows[0]["ImageName"], results.Rows[0]["Price"], results.Rows[0]["Description"],results.Rows[0]["ProductId"]);
        }
        return details;
    }
}