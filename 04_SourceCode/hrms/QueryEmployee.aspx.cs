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

    protected void Basic_CheckedChanged(object sender, EventArgs e)
    {
        if (Basic.Checked)
        {
            Forename.Checked = true;
            Surname.Checked = true;
            Position.Checked = true;
        }
        else
        {
            Forename.Checked = false;
            Surname.Checked = false;
            Position.Checked = false;
        }
    }
}