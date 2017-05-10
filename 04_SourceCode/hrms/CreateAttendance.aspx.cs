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

        SqlCommand myCommand = new SqlCommand("sp_addAttendance", conn);
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

        cmdParameter = new SqlParameter("@Year", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DropDownListYear.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Month", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DropDownListMonth.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day1", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day1.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day2", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day2.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day3", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day3.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day4", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day4.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day5", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day5.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day6", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day6.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day7", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day7.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day8", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day8.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day9", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day9.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day10", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day10.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day11", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day11.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day12", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day12.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day13", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day13.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day14", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day14.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day15", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day15.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day16", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day16.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day17", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day17.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day18", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day18.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day19", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day19.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day20", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day20.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day21", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day21.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day22", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day22.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day23", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day23.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day24", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day24.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day25", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day25.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day26", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day26.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day27", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day27.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day28", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day28.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day29", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day29.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day30", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day30.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Day31", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Day31.Checked ? 1 : 0;
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
        }
    }
}