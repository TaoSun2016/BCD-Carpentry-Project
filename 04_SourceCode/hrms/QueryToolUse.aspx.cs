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
        //this.GridViewToolUse.AllowPaging = false;
        this.GridViewToolUse.AllowSorting = false;
        GridViewToolUse.Columns[0].Visible = false;
        GridViewToolUse.Columns[1].Visible = false;
        GridViewToolUse.DataBind();


        toExcel(this.GridViewToolUse);

        //this.GridViewToolUse.AllowPaging = true;
        this.GridViewToolUse.AllowSorting = true;
        GridViewToolUse.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "ToolUse" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewToolUse.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname,t.* FROM [EMPLOYEE] e,[TOOL_USE_REGISTER] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' ";
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
            sql = sql  + " and t.date>='" + BeginDate.Text.Trim() + "'";
        }

        if (EndDate.Text.Trim()!="")
        {
            sql = sql + " and t.date<='" + EndDate.Text.Trim() + "'";
        }
        SqlDataSourceToolUse.SelectCommand = sql + " order by e.Forename,e.Surname,t.[Date]";
        GridViewToolUse.DataBind();
        GridViewToolUse.Visible = true;
        Export.Visible = true;
    }

    protected void ImageBeginDate_Click(object sender, EventArgs e)
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

    protected void ImageEndDate_Click(object sender, EventArgs e)
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

    protected void CalendarBeginDate_SelectionChanged(object sender, EventArgs e)
    {
        BeginDate.Text = CalendarBeginDate.SelectedDate.ToString("yyyyMMdd");
        CalendarBeginDate.Visible = false;
    }

    protected void CalendarEndDate_SelectionChanged(object sender, EventArgs e)
    {
        EndDate.Text = CalendarEndDate.SelectedDate.ToString("yyyyMMdd");
        CalendarEndDate.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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
}