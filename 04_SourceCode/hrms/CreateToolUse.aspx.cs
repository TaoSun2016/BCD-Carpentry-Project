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

        RequiredFieldValidator1.Enabled = true;
        RequiredFieldValidator2.Enabled = true;


        if (Forename.Text.Trim() == "" && Surname.Text.Trim() == "" && Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not be null at the same time!')</script>");
            return;
        }

        if (Date.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('Please input date!')</script>");
            return;
        }

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addToolUse", conn);
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

        cmdParameter = new SqlParameter("@Date", SqlDbType.VarChar,10);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Date.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ToolName", SqlDbType.VarChar,60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = ToolName.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ToolNumber", SqlDbType.VarChar, 20);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = ToolNumber.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@InOut", SqlDbType.VarChar, 30);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = InOut.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Comment", SqlDbType.VarChar, 120);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Comment.Text;
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Add Error!')</script>");

        }
        else
        {
            ClearData();
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Add successfully!')</script>");
            
        }
    }

    protected void Calendar_SelectionChanged(object sender, EventArgs e)
    {
        Date.Text = Calendar.SelectedDate.ToString("dd-MM-yyyy");
        Calendar.Visible = false;
    }

    protected void CalenderButton_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar.Visible == true)
        {
            Calendar.Visible = false;
        }
        else
        {
            Calendar.Visible = true;
        }
    }
    private void ClearData()
    {
        Forename.Text = "";
        Surname.Text = "";
        Email.Text = "";
        Date.Text = "";
        ToolName.Text = "";
        ToolNumber.Text = "";
        Comment.Text = "";
    }
}