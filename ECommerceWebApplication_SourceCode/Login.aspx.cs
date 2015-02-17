using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string query = "Select * from CustomerDetails";
        //DataTable dt = new Database().ExecuteQuery(query);
        HttpContext.Current.Session.Clear();

    }


    protected void Login_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@username", username.Text);
        parameters.Add("@password",password.Text);
        DataTable results = new Database().ExecuteStoredProc("AuthenticateUser", parameters);
        if (results.Rows.Count > 0)
        {
            HttpContext.Current.Session["UserId"] = results.Rows[0][0].ToString();
            HttpContext.Current.Session["UserFirstName"] = results.Rows[0][1].ToString();
            Response.Redirect("home.aspx?userid=" + results.Rows[0][0].ToString());
        }
        else
        {
            loginMessage.Visible = true;
            loginMessage.Text = "Invalid username or password";
        }
    }
}