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
        //this.GridViewCertification.AllowPaging = false;
        this.GridViewCertification.AllowSorting = false;
        GridViewCertification.Columns[0].Visible = false;
        GridViewCertification.Columns[1].Visible = false;
        GridViewCertification.DataBind();


        toExcel(this.GridViewCertification);

        //this.GridViewCertification.AllowPaging = true;
        this.GridViewCertification.AllowSorting = true;
        GridViewCertification.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            //make the column invisible if don't want export them
            //gridview1.Columns[9].Visible = false;

            string fileName = "Certification" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
            string style = @"<style> .text { mso-number-format:\@; } </script> ";
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.GridViewCertification.RenderControl(htw);
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
        string sql = "SELECT e.Forename, e.Surname,e.Position,e.YearsInBCD,e.YearsInIndustry,e.SiteSafePhoto,c.* FROM [Employee] e, [Certification] c  where e.EmployeeID = c.EmployeeID ";
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


        SqlDataSourceCertification.SelectCommand = sql;
        GridViewCertification.DataBind();
    }
}