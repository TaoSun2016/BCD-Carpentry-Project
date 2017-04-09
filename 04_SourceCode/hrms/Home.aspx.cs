using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserName = (string)Session["UserName"];
        if (UserName == "")
        {
           Response.Redirect("Default.aspx");
        }
        Forename.Text = (string)Session["Forename"];
        Surname.Text = (string)Session["Surname"];
    }
}