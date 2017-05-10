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

        if ((Forename.Text.Trim() != "" || Surname.Text.Trim() != "")&&Email.Text.Trim() != "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not have value at the same time!')</script>");
        }
        if (Forename.Text.Trim() == "" && Surname.Text.Trim() == "" && Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not be null at the same time!')</script>");
        }

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addTimeSheet", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Forename.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Surname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Email", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Email.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WeekEndingDate", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = WeekEndingDate.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@MainContractor", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = MainContractor.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@JobName", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = JobName.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Date", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Date.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Description", SqlDbType.VarChar, 255);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Description.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@StartTime", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Start.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@EndTime", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Finish.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Hours", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Hours.Text;
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
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Add successfully!')</script>");
            ClearData();
        }
    }
    private void ClearData()
    {

        Date.Text = "";
        Description.Text = "";
        Start.Text = "";
        Finish.Text = "";
        Hours.Text = "";
        
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        Forename.Text = "";
        Surname.Text = "";
        Email.Text = "";
        WeekEndingDate.Text = "";
        MainContractor.Text = "";
        JobName.Text = "";

        Date.Text = "";
        Description.Text = "";
        Start.Text = "";
        Finish.Text = "";
        Hours.Text = "";
    }
}