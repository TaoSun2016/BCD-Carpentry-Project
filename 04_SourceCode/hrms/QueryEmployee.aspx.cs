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
            DOB.Checked = true;
            HireDate.Checked = true;
            YearsInBCD.Checked = true;
            YearsInIndustry.Checked = true;
            DriverLicenseNumber.Checked = true;
            DriverLicenseClass.Checked = true;
            DriverLicenseExpiryDate.Checked = true;
            DriverLicensePhoto.Checked = true;
            SiteSafePhoto.Checked = true;

        }
        else
        {
            Forename.Checked = false;
            Surname.Checked = false;
            Position.Checked = false;
            DOB.Checked = false;
            HireDate.Checked = false;
            YearsInBCD.Checked = false;
            YearsInIndustry.Checked = false;
            DriverLicenseNumber.Checked = false;
            DriverLicenseClass.Checked = false;
            DriverLicenseExpiryDate.Checked = false;
            DriverLicensePhoto.Checked = false;
            SiteSafePhoto.Checked = false;
        }
    }

    protected void Contact_CheckedChanged(object sender, EventArgs e)
    {
        if (Contact.Checked)
        {
            MobileNumber.Checked = true;
            HomeNumber.Checked = true;
            Email.Checked = true;
            KinName.Checked = true;
            KinNumber.Checked = true;
        }
        else
        {
            MobileNumber.Checked = false;
            HomeNumber.Checked = false;
            Email.Checked = false;
            KinName.Checked = false;
            KinNumber.Checked = false;
        }
    }

    protected void Account_CheckedChanged(object sender, EventArgs e)
    {
        if (Account.Checked)
        {
            BankName.Checked = true;
            AccountNumber.Checked = true;
            PayRate.Checked = true;
            TaxRate.Checked = true;
            IRDNumber.Checked = true;
        }
        else
        {
            BankName.Checked = false;
            AccountNumber.Checked = false;
            PayRate.Checked = false;
            TaxRate.Checked = false;
            IRDNumber.Checked = false;
        }       
    }

    protected void Address_CheckedChanged(object sender, EventArgs e)
    {
        if (Address.Checked)
        {
            Country.Checked = true;
            City.Checked = true;
            Suburb.Checked = true;
            Street.Checked = true;
            PostCode.Checked = true;
        }
        else
        {
            Country.Checked = false;
            City.Checked = false;
            Suburb.Checked = false;
            Street.Checked = false;
            PostCode.Checked = false;
        }
    }

    protected void Query_Click(object sender, EventArgs e)
    {
        int Count = 0;

        EmployeeGridView.DataBind();

        foreach (DataControlField Field in EmployeeGridView.Columns)
        {
            switch (Field.HeaderText){
                case "Forename":
                    if(Forename.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }                   
                    break;
                case "Surname":
                    if (Surname.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Position":
                    if (Position.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "HomeNumber":
                    if (HomeNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "MobileNumber":
                    if (MobileNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Email":
                    if (Email.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "DOB":
                    if (DOB.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "KinName":
                    if (KinName.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "KinNumber":
                    if (KinNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "BankName":
                    if (BankName.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "AccountNumber":
                    if (AccountNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "IRDNumber":
                    if (IRDNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "PayRate":
                    if (PayRate.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "TaxRate":
                    if (TaxRate.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "DriverLicenseNumber":
                    if (DriverLicenseNumber.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "DriverLicenseClass":
                    if (DriverLicenseClass.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "DriverLicenseExpiryDate":
                    if (DriverLicenseExpiryDate.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "DriverLicensePhoto":
                    if (DriverLicensePhoto.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "SiteSafePhoto":
                    if (SiteSafePhoto.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "HireDate":
                    if (HireDate.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "ResignDate":
                    if (ResignDate.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "YearsInBCD":
                    if (YearsInBCD.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "YearsInIndustry":
                    if (YearsInIndustry.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Country":
                    if (Country.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "City":
                    if (City.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Suburb":
                    if (Suburb.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Street":
                    if (Street.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "PostCode":
                    if (PostCode.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;
                case "Note":
                    if (Note.Checked == false)
                    {
                        Field.Visible = false;
                    }
                    else
                    {
                        Field.Visible = true;
                        Count++;
                    }
                    break;                
                default:
                    break;
            }

        }
        if (Count > 0)
        {
            EmployeeGridView.Visible = true;
            Export.Visible = true;
        }
    }
}