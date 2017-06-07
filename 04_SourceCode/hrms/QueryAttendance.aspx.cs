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
        if (Session["UserName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }


    protected void Export_Click(object sender, EventArgs e)
    {
        //this.GridViewAttendance.AllowPaging = false;
        this.GridViewAttendance.AllowSorting = false;
        GridViewAttendance.Columns[0].Visible = false;
        GridViewAttendance.Columns[1].Visible = false;
        GridViewAttendance.DataBind();


        toExcel(this.GridViewAttendance);

        //this.GridViewAttendance.AllowPaging = true;
        this.GridViewAttendance.AllowSorting = true;
        GridViewAttendance.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "Attendance" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewAttendance.RenderControl(htw);
            Response.Write(style);
            Response.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        else
        {
            //Response.Write("No data to export!");
            ClientScript.RegisterStartupScript(typeof(string), "nodata", "<script>alert('No data to export!!')</script>");
        }
    }

    public override void VerifyRenderingInServerForm(Control control) { }

    protected void Query_Click(object sender, EventArgs e)
    {
        string sql = "SELECT e.Forename, e.Surname, a.EmployeeID, a.Year, a.Month, CASE a.Day1 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day1, CASE a.Day2 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day2, CASE a.Day3 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day3,CASE a.Day4 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day4,CASE a.Day5 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day5,CASE a.Day6 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day6, CASE a.Day7 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day7,CASE a.Day8 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day8,CASE a.Day9 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day9,CASE a.Day10 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day10,CASE a.Day11 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day11,CASE a.Day12 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day12,CASE a.Day13 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day13,CASE a.Day14 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day14,CASE a.Day15 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day15,CASE a.Day16 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day16,CASE a.Day17 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day17,CASE a.Day18 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day18,CASE a.Day19 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day19,CASE a.Day20 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day20,CASE a.Day21 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day21,CASE a.Day22 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day22,CASE a.Day23 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day23,CASE a.Day24 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day24,CASE a.Day25 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day25,CASE a.Day26 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day26,CASE a.Day27 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day27,CASE a.Day28 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day28,CASE a.Day29 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day29,CASE a.Day30 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day30,CASE a.Day31 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day31 FROM [EMPLOYEE] e, [ATTENDANCE] a WHERE e.EmployeeID = a.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim() != "")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim() != "" && Surname.Text.Trim() != "")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }

        if (DropDownListYear.SelectedValue != "")
        {
            sql += " and a.Year = " + DropDownListYear.SelectedValue;
        }

        if (DropDownListMonth.SelectedValue != "")
        {
            sql += " and a.Month = " + DropDownListMonth.SelectedValue;
        }

        SqlDataSourceAttendance.SelectCommand = sql + "  order by a.Year desc, a.Month desc, e.Forename,e.Surname";
        GridViewAttendance.DataBind();
    }
}