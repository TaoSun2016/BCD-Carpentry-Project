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
        //this.GridViewTax.AllowPaging = false;
        this.GridViewTax.AllowSorting = false;
        GridViewTax.Columns[0].Visible = false;
        GridViewTax.Columns[1].Visible = false;
        GridViewTax.DataBind();


        toExcel(this.GridViewTax);

        //this.GridViewTax.AllowPaging = true;
        this.GridViewTax.AllowSorting = true;
        GridViewTax.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "TaxItem" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewTax.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname, e.IRDNumber, e.TaxRate,  t.* FROM [EMPLOYEE] e,[TAX] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' ";
        if (Email.Text.Trim()!="")
        {
            sql += " and e.Email = '" + Email.Text.Trim() + "'";
        }
        else if (Forename.Text.Trim()!="" && Surname.Text.Trim()!="")
        {
            sql += " and e.Forename = '" + Forename.Text.Trim() + "' and e.Surname = '" + Surname.Text.Trim() + "'";
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('Please input employee''s name or Email address!')</script>");
        }

        if (WeekEndingDate.Text.Trim()!="")
        {
            sql = sql  + " and t.WeekEndingDate ='" + WeekEndingDate.Text.Trim() + "'";
        }

        SqlDataSourceTax.SelectCommand = sql + " order by e.Forename, e.Surname, t.WeekEndingDate, t.Category";
        GridViewTax.DataBind();
    }
}