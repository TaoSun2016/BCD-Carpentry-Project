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
        //this.GridViewWage.AllowPaging = false;
        this.GridViewWage.AllowSorting = false;
        GridViewWage.Columns[0].Visible = false;
        GridViewWage.Columns[1].Visible = false;
        GridViewWage.DataBind();


        toExcel(this.GridViewWage);

        //this.GridViewWage.AllowPaging = true;
        this.GridViewWage.AllowSorting = true;
        GridViewWage.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "Wage" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewWage.RenderControl(htw);
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



    protected void Query_Click(object sender, EventArgs e)
    {
        string sql = "SELECT e.Forename, e.Surname, e.PayRate, e.TaxRate, e.Position, w.* FROM [EMPLOYEE] e,[WAGE] w WHERE e.EmployeeID = w.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim()!="")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim()!="" && Surname.Text.Trim()!="")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }


        if (WeekEndingDate.Text.Trim()!="")
        {
            sql = sql  + " and w.WeekEndingDate ='" + WeekEndingDate.Text.Trim() + "'";
        }

        SqlDataSourceWage.SelectCommand = sql + " order by e.Forename, e.Surname, w.WeekEndingDate";
        GridViewWage.DataBind();
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