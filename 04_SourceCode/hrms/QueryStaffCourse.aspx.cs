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
        //this.GridViewStaffCourse.AllowPaging = false;
        this.GridViewStaffCourse.AllowSorting = false;
        GridViewStaffCourse.Columns[0].Visible = false;
        GridViewStaffCourse.Columns[1].Visible = false;
        GridViewStaffCourse.DataBind();


        toExcel(this.GridViewStaffCourse);

        //this.GridViewStaffCourse.AllowPaging = true;
        this.GridViewStaffCourse.AllowSorting = true;
        GridViewStaffCourse.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "StaffCourse" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewStaffCourse.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname,c.* FROM [EMPLOYEE] e,[COURSE] c WHERE e.EmployeeID = c.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim()!="")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim()!="" && Surname.Text.Trim()!="")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }

        if (BeginDate.Text.Trim()!="")
        {
            sql = sql  + " and c.date>='" + BeginDate.Text.Trim() + "'";
        }

        if (EndDate.Text.Trim()!="")
        {
            sql = sql + " and c.date<='" + EndDate.Text.Trim() + "'";
        }
        SqlDataSourceStaffCourse.SelectCommand = sql + " order by c.[Date],e.Forename,e.Surname";
        GridViewStaffCourse.DataBind();
    }
    protected void ImageButtonBeginDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarBeginDate.Visible == true)
        {
            CalendarBeginDate.Visible = false;
        }
        else
        {
            CalendarBeginDate.Visible = true;
        }
    }

    protected void CalendarBeginDate_SelectionChanged(object sender, EventArgs e)
    {
        BeginDate.Text = CalendarBeginDate.SelectedDate.ToString("yyyyMMdd");
        CalendarBeginDate.Visible = false;
    }

    protected void ImageButtonEndDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarEndDate.Visible == true)
        {
            CalendarEndDate.Visible = false;
        }
        else
        {
            CalendarEndDate.Visible = true;
        }
    }

    protected void CalendarEndDate_SelectionChanged(object sender, EventArgs e)
    {
        EndDate.Text = CalendarEndDate.SelectedDate.ToString("yyyyMMdd");
        CalendarEndDate.Visible = false;
    }


}