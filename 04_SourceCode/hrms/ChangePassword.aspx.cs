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

    protected void Change_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;

        if (Email.Text.Trim()=="" )
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Please input User Name!')</script>");
            return;
        }
        if (OldPassword.Text.Trim() == "" )
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Please input Old Password!')</script>");
            return;
        }
        if (NewPassword.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Please input New Password!')</script>");
            return;
        }
        if (ConfirmPassword.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Please input Confirm Password!')</script>");
            return;
        }
        if (OldPassword.Text.Trim() == NewPassword.Text.Trim())
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Old password and new password can not be same!')</script>");
            return;
        }
        if (ConfirmPassword.Text.Trim() != NewPassword.Text.Trim())
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Confirm password is not same as new password!')</script>");
            return;
        }

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_changePassword", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@UserName", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Email.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@OldPassword", SqlDbType.VarChar,50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = OldPassword.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@NewPassword", SqlDbType.VarChar,100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = NewPassword.Text.Trim();
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Change errror!')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Change password successfully!')</script>");
        }
            
    }
}