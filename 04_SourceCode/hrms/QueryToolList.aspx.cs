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
        //this.GridViewToolList.AllowPaging = false;
        this.GridViewToolList.AllowSorting = false;
        GridViewToolList.Columns[0].Visible = false;
        GridViewToolList.Columns[1].Visible = false;
        GridViewToolList.DataBind();


        toExcel(this.GridViewToolList);

        //this.GridViewToolList.AllowPaging = true;
        this.GridViewToolList.AllowSorting = true;
        GridViewToolList.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "ToolList" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewToolList.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname, e.Position, t.* FROM [EMPLOYEE] e,[TOOL_LIST] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim() != "")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim() != "" && Surname.Text.Trim() != "")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('Please input employee''s name or Email address!')</script>");
        }


        SqlDataSourceToolList.SelectCommand = sql + " order by e.Forename,e.Surname,t.ToolName";
        GridViewToolList.DataBind();
        GridViewToolList.Visible = true;
        Export.Visible = true;
    }
}