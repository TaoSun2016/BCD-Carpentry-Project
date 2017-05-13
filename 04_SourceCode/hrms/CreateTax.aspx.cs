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

        SqlCommand myCommand = new SqlCommand("sp_addTax", conn);
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

        cmdParameter = new SqlParameter("@Category", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Category.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Amount", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Amount.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Note", SqlDbType.VarChar,256);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Note.Text;
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
        WeekEndingDate.Text = "";
        Category.SelectedValue = "1";
        Amount.Text = "0.00";
        Note.Text = "";

    }

    protected void Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Category.SelectedValue == "4")
        {
            Note.ReadOnly = false;
        }
    }
    protected void ImageButtonWeekEndingDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarWeekEndingDate.Visible == true)
        {
            CalendarWeekEndingDate.Visible = false;
        }
        else
        {
            CalendarWeekEndingDate.Visible = true;
        }
    }

    protected void CalendarWeekEndingDate_SelectionChanged(object sender, EventArgs e)
    {
        WeekEndingDate.Text = CalendarWeekEndingDate.SelectedDate.ToString("yyyyMMdd");
        CalendarWeekEndingDate.Visible = false;
    }
}