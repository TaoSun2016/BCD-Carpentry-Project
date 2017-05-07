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

    }

    private void Clear_Fields()
    {
        Position.Text = "";
        OtherPositions.Text = "";
        HireDate.Text = "";
        YearsInIndustry.Text = "";
        DriverLicenseClass.Text = "";
        SiteSafe.ImageUrl = "";
    }

    protected void Query_Click(object sender, EventArgs e)
    {
        int resultCount;

        Clear_Fields();
        if (Q_Forename.Text.Trim() == "" && Q_Surname.Text.Trim() == ""
         && Q_Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('Must input at least one query condition!')</script>");
            return;
        }

        String sqlState;
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        sqlState = "select count(*) as Count from EMPLOYEE where EmployeeStatus = 'Y'"
                + (Q_Forename.Text.Trim() == "" ? "" : (" and Forename = '" + Q_Forename.Text.Trim() + "'"))
                + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                + (Q_Email.Text.Trim() == "" ? "" : (" and Email = '" + Q_Email.Text.Trim() + "'"));

        SqlCommand myCommand = new SqlCommand(sqlState, conn);
        myCommand.CommandType = CommandType.Text;

        conn.Open();

        SqlDataReader dr = myCommand.ExecuteReader();
        dr.Read();
        resultCount = (int)dr["Count"];

        dr.Close();

        switch (resultCount)
        {
            case 0:
                ClientScript.RegisterStartupScript(typeof(string), "noEmployee", "<script>alert('Can not find the employee's information!')</script>");
                break;
            case 1:
                sqlState = "select * from EMPLOYEE where EmployeeStatus = 'Y'"
                            + (Q_Forename.Text.Trim() == "" ? "" : (" and Forename = '" + Q_Forename.Text.Trim() + "'"))
                            + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                            + (Q_Email.Text.Trim() == "" ? "" : (" and Email = '" + Q_Email.Text.Trim() + "'"));
                myCommand = new SqlCommand(sqlState, conn);
                myCommand.CommandType = CommandType.Text;

                dr = myCommand.ExecuteReader();
                dr.Read();
                showEmployeeInformation(dr);
                dr.Close();
                break;
            default:
                ClientScript.RegisterStartupScript(typeof(string), "moreEmployee", "<script>alert('Find more than one employee's information!')</script>");
                break;
        }

        conn.Close();

    }

    private void showEmployeeInformation(SqlDataReader dr)
    {
        Position.Text = dr["Position"].ToString();
        HireDate.Text = ((DateTime)dr["HireDate"]).ToString("yyyymmdd");
        YearsInIndustry.Text = dr["YearsInIndustry"].ToString();
        DriverLicenseClass.Text = dr["DriverLicenseClass"].ToString();
        SiteSafe.ImageUrl = dr["SiteSafePhoto"].ToString();
    }

    protected void ADD_Click(object sender, EventArgs e)
    {

    }
}