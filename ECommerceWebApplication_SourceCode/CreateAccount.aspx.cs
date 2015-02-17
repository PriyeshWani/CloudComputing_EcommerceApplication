using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateAccountMethod(object sender, EventArgs e)
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("@firstname", firstname.Text);
        parameters.Add("@lastname", lastname.Text);
        parameters.Add("@username", email.Text);
        parameters.Add("@password", password.Text);
        parameters.Add("@ContactNo", ContactNo.Text);
        DataTable results = new Database().ExecuteStoredProc("CreateAccount", parameters);
        Message.Visible = true;
        PlaceHolder1.Visible = false;
        Message.Text = "Account Created succesfully";
    }
}