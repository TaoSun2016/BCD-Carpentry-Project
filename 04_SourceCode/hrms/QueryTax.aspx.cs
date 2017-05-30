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
        this.GridViewTax.AllowSorting = false;
        GridViewTax.DataBind();

        toExcel(this.GridViewTax);

        this.GridViewTax.AllowSorting = true;
        GridViewTax.DataBind();
    }

    private void toExcel(GridView gv)
    {
        if (gv.Rows.Count > 0)
        {
            string fileName = "TaxReport" + DateTime.Now.ToString("_yyyyMMdd") + ".xls";
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
            //Response.Write("No data to export!");
            ClientScript.RegisterStartupScript(typeof(string), "nodata", "<script>alert('No data to export!!')</script>");
        }
    }

    public override void VerifyRenderingInServerForm(Control control) { }

    protected void Query_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_reportTax", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@BeginWeekEnding", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = BeginWeekEnding.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@EndWeekEnding", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = EndWeekEnding.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        
        //////////////////////////////////////////////////////////
        cmdParameter = new SqlParameter("@ErrCode", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ErrMsg", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        conn.Open();

        myCommand.ExecuteNonQuery();


        ErrCode = (int)myCommand.Parameters["@ErrCode"].Value;
        ErrMsg = (string)myCommand.Parameters["@ErrMsg"].Value;

        conn.Close();

        if (ErrCode != 0)
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Query Error!')</script>");

        }
        else
        {
            GridViewTax.DataBind();
        }
        
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
        BeginWeekEnding.Text = CalendarBeginDate.SelectedDate.ToString("yyyyMMdd");
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
        EndWeekEnding.Text = CalendarEndDate.SelectedDate.ToString("yyyyMMdd");
        CalendarEndDate.Visible = false;
    }
}