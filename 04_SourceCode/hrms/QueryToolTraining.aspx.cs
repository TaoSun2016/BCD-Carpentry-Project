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
        //this.GridViewToolTraining.AllowPaging = false;
        this.GridViewToolTraining.AllowSorting = false;
        GridViewToolTraining.Columns[0].Visible = false;
        GridViewToolTraining.Columns[1].Visible = false;
        GridViewToolTraining.DataBind();


        toExcel(this.GridViewToolTraining);

        //this.GridViewToolTraining.AllowPaging = true;
        this.GridViewToolTraining.AllowSorting = true;
        GridViewToolTraining.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "Vehicle" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewToolTraining.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname,t.* , case TrainingType when 1 then 'I OWN AND AM TRAINED IN THIS TOOL' when 2 then 'I HAVE READ THIS INFORMATION BOOK AND UNDERSTAND THE USE AND CARE' when 3 then 'FOREMAN TRAINED AND WITNESSED GOOD SAFE WORKING PRACTICES' end as TrainingTypeNote FROM [EMPLOYEE] e,[TOOL_TRAINING] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim() != "")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim() != "" && Surname.Text.Trim() != "")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }

        if (BeginDate.Text.Trim() != "")
        {
            sql = sql + " and t.date>='" + BeginDate.Text.Trim() + "'";
        }

        if (EndDate.Text.Trim() != "")
        {
            sql = sql + " and t.date<='" + EndDate.Text.Trim() + "'";
        }
        SqlDataSourceToolTraining.SelectCommand = sql + " order by e.Forename,e.Surname,t.[Date]";
        GridViewToolTraining.DataBind();
        GridViewToolTraining.Visible = true;
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