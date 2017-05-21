using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void Add_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;



        if (Forename.Text.Trim() == "" && Surname.Text.Trim() == "" && Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not be null at the same time!')</script>");
            return;
        }



        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addStaffSize", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Forename.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar,50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Surname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Email", SqlDbType.VarChar,100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Email.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Shirt", SqlDbType.VarChar,60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Shirt.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@Jersey", SqlDbType.Char);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Jersey.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WWTop", SqlDbType.Char);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = WWTop.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WWPants", SqlDbType.Char);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = WWPants.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Pants", SqlDbType.Char);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Pants.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Shoe", SqlDbType.Char);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Shoe.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);
        //////////////////////////////////////////////////////////
        cmdParameter = new SqlParameter("@ErrCode", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ErrMsg", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        conn.Open();

        myCommand.ExecuteNonQuery();


        ErrCode = (int)myCommand.Parameters["@ErrCode"].Value;
        ErrMsg = (string)myCommand.Parameters["@ErrMsg"].Value;

        conn.Close();

        if (ErrCode != 0)
        {
            //ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Add Error!')</script>");
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");

        }
        else
        {
            ClearData();
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Add successfully!')</script>");
            
        }
    }

    private void ClearData()
    {
        Forename.Text = "";
        Surname.Text = "";
        Email.Text = "";
    }
}