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


        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addStaffCourse", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar,50);
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

        cmdParameter = new SqlParameter("@Date", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Date.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Course", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Course.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Company", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Company.Text;
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@DebtEntered", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DebtEntered.Checked ? "Y" : "N";
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@CertReceived", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = CertReceived.Checked ? "Y" : "N";
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@Copied", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Copied.Checked ? "Y" : "N";
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@Scanned", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Scanned.Checked ? "Y" : "N";
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@Presented", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Presented.Checked ? "Y" : "N";
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Add successfully!')</script>");
            ClearData();
        }
     }

    private void ClearData()
    {
        Forename.Text = "";
        Surname.Text = "";
        Email.Text = "";
        Date.Text = "";
        Course.Text = "";
        Company.Text = "";
        DebtEntered.Checked = false;
        CertReceived.Checked = false;
        Copied.Checked = false;
        Scanned.Checked = false;
        Presented.Checked = false;
    }

    protected void ImageButtonDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarDate.Visible == true)
        {
            CalendarDate.Visible = false;
        }
        else
        {
            CalendarDate.Visible = true;
        }
    }

    protected void CalendarDate_SelectionChanged(object sender, EventArgs e)
    {
        Date.Text = CalendarDate.SelectedDate.ToString("yyyyMMdd");
        CalendarDate.Visible = false;
    }
}