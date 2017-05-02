using System;
using System.IO;
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


    protected void Query_Click(object sender, EventArgs e)
    {
        /*
        int resultCount;


        if (Q_Forname.Text.Trim() == "" && Q_Surname.Text.Trim() == ""
         && Q_DOB.Text.Trim() == "" && Q_Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('Must input at least one query condition!')</script>");
            return;
        }

        String sqlState;
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        sqlState = "select count(*) as Count from EMPLOYEE where 1=1"
                + (Q_Forname.Text.Trim() == "" ? "" : (" and Forname = '" + Q_Forname.Text.Trim() + "'"))
                + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                + (Q_DOB.Text.Trim() == "" ? "" : (" and DOB = '" + Q_DOB.Text.Trim() + "'"))
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
                sqlState = "select * from EMPLOYEE where 1=1"
                            + (Q_Forname.Text.Trim() == "" ? "" : (" and Forname = '" + Q_Forname.Text.Trim() + "'"))
                            + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                            + (Q_DOB.Text.Trim() == "" ? "" : (" and DOB = '" + Q_DOB.Text.Trim() + "'"))
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
        */

    }

    private void showEmployeeInformation(SqlDataReader dr)
    {



    }

    protected void Export_Click(object sender, EventArgs e)
    {
        //this.EmployeeGridView.AllowPaging = false;
        this.EmployeeGridView.AllowSorting = false;
        EmployeeGridView.Columns[0].Visible = false;
        EmployeeGridView.Columns[1].Visible = false;
        EmployeeGridView.DataBind();


        toExcel(this.EmployeeGridView);

        //this.EmployeeGridView.AllowPaging = true;
        this.EmployeeGridView.AllowSorting = true;
        EmployeeGridView.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "Employee" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.EmployeeGridView.RenderControl(htw);
            Response.Write(style);
            Response.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        else
        {
            Response.Write("No data to export!");
        }
    }

    public override void VerifyRenderingInServerForm(Control control) { }
}