using System;
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

    private void Clear_Fields()
    {
        EmployeeID.Value = "";
        oldForename.Value = "";
        oldSurname.Value = "";
        oldDOB.Value = "";
        oldPosition.Value = "";
        oldHireDate.Value = "";
        oldResignDate.Value = "";
        oldYearsInBCD.Value = "";
        oldYearsInIndustry.Value = "";
        oldDriverLicenseNumber.Value = "";
        oldDriverLicenseClass.Value = "";
        oldDriverLicenseExpiryDate.Value = "";
        oldMobileNumber.Value = "";
        oldHomeNumber.Value = "";
        oldEmail.Value = "";
        oldKinName.Value = "";
        oldKinNumber.Value = "";
        oldBankName.Value = "";
        oldAccountNumber.Value = "";
        oldPayRate.Value = "";
        oldTaxRate.Value = "";
        oldIRDNumber.Value = "";
        oldCountry.Value = "";
        oldCity.Value = "";
        oldSuburb.Value = "";
        oldStreet.Value = "";
        oldPostCode.Value = "";
        oldNote.Value = "";

        Forename.Text="";
        Surname.Text="";
        DOB.Text = "";
        Position.Text = "";
        HireDate.Text = "";
        ResignDate.Text = "";
        YearsInBCD.Text = "";
        YearsInIndustry.Text = "";
        DriverLicenseNumber.Text = "";
        DriverLicenseClass.Text = "";
        DriverLicenseExpiryDate.Text = "";
        DriverLicense.ImageUrl = "";
        SiteSafe.ImageUrl = "";
        MobileNumber.Text = "";
        HomeNumber.Text = "";
        Email.Text = "";
        KinName.Text = "";
        KinNumber.Text = "";
        BankName.Text = "";
        AccountNumber.Text = "";
        PayRate.Text = "";
        TaxRate.Text = "";
        IRDNumber.Text = "";
        Country.Text = "";
        City.Text = "";
        Suburb.Text = "";
        Street.Text = "";
        PostCode.Text = "";
        Note.Text = "";
    }

    protected void Query_Click(object sender, EventArgs e)
    {
        int resultCount;

        Clear_Fields();
        if (Q_Forename.Text.Trim() == "" && Q_Surname.Text.Trim() == "" 
         && Q_Email.Text.Trim() == "") {
            ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('Must input at least one query condition!')</script>");
            return;
        }

        String sqlState;
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        sqlState = "select count(*) as Count from EMPLOYEE where EmployeeStatus = 'Y'"
                + (Q_Forename.Text.Trim() == "" ? "" : (" and Forename = '" + Q_Forename.Text.Trim() + "'"))
                + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                + (Q_Email.Text.Trim() == "" ? "" : (" and Email = '" + Q_Email.Text.Trim() + "'"));
        
       SqlCommand myCommand = new SqlCommand(sqlState, conn);
        myCommand.CommandType = CommandType.Text;

        conn.Open();

        SqlDataReader dr = myCommand.ExecuteReader();
        dr.Read();
        resultCount = (int)dr["Count"];

        dr.Close();

        switch (resultCount)
        {
            case 0:
                ClientScript.RegisterStartupScript(typeof(string), "noEmployee", "<script>alert('Can not find the employee's information!')</script>");
                break;
            case 1:
                sqlState = "select * from EMPLOYEE where EmployeeStatus = 'Y'"
                            + (Q_Forename.Text.Trim() == "" ? "" : (" and Forename = '" + Q_Forename.Text.Trim() + "'"))
                            + (Q_Surname.Text.Trim() == "" ? "" : (" and Surname = '" + Q_Surname.Text.Trim() + "'"))
                            + (Q_Email.Text.Trim() == "" ? "" : (" and Email = '" + Q_Email.Text.Trim() + "'"));
                myCommand = new SqlCommand(sqlState, conn);
                myCommand.CommandType = CommandType.Text;

                dr = myCommand.ExecuteReader();
                dr.Read();
                showEmployeeInformation(dr);
                dr.Close();
                break;
            default:
                ClientScript.RegisterStartupScript(typeof(string), "moreEmployee", "<script>alert('Find more than one employee's information!')</script>");
                break;
        }

        conn.Close();

    }

    private void showEmployeeInformation(SqlDataReader dr)
    {
        
        EmployeeID.Value = dr["EmployeeID"].ToString();
        
        oldForename.Value = Forename.Text = dr["Forename"].ToString();
        oldSurname.Value = Surname.Text = dr["Surname"].ToString();
        oldDOB.Value = DOB.Text = ((DateTime)dr["DOB"]).ToString("yyyymmdd");
        oldPosition.Value = Position.Text = dr["Position"].ToString();
        oldHireDate.Value = HireDate.Text = ((DateTime)dr["HireDate"]).ToString("yyyymmdd");
        oldResignDate.Value = ResignDate.Text = (dr["ResignDate"].ToString()=="")?"":((DateTime)dr["ResignDate"]).ToString("yyyymmdd");
        oldYearsInBCD.Value = YearsInBCD.Text = dr["YearsInBCD"].ToString();
        oldYearsInIndustry.Value = YearsInIndustry.Text = dr["YearsInIndustry"].ToString();
        oldDriverLicenseNumber.Value = DriverLicenseNumber.Text = dr["DriverLicenseNumber"].ToString();
        oldDriverLicenseClass.Value = DriverLicenseClass.Text = dr["DriverLicenseClass"].ToString();
        oldDriverLicenseExpiryDate.Value = DriverLicenseExpiryDate.Text = (dr["DriverLicenseExpiryDate"].ToString()=="")?"": ((DateTime)dr["DriverLicenseExpiryDate"]).ToString("yyyymmdd");
        DriverLicense.ImageUrl = dr["DriverLicensePhoto"].ToString();
        SiteSafe.ImageUrl = dr["SiteSafePhoto"].ToString();
        oldMobileNumber.Value = MobileNumber.Text = dr["MobileNumber"].ToString();
        oldHomeNumber.Value = HomeNumber.Text = dr["HomeNumber"].ToString();
        oldEmail.Value = Email.Text = dr["Email"].ToString();
        oldKinName.Value = KinName.Text = dr["KinName"].ToString();
        oldKinNumber.Value = KinNumber.Text = dr["KinNumber"].ToString();
        oldBankName.Value = BankName.Text = dr["BankName"].ToString();
        oldAccountNumber.Value = AccountNumber.Text = dr["AccountNumber"].ToString();
        oldPayRate.Value = PayRate.Text = dr["PayRate"].ToString();
        oldTaxRate.Value = TaxRate.Text = dr["TaxRate"].ToString();
        oldIRDNumber.Value = IRDNumber.Text = dr["IRDNumber"].ToString();
        oldCountry.Value = Country.Text = dr["Country"].ToString();
        oldCity.Value = City.Text = dr["City"].ToString();
        oldSuburb.Value = Suburb.Text = dr["Suburb"].ToString();
        oldStreet.Value = Street.Text = dr["Street"].ToString();
        oldPostCode.Value = PostCode.Text = dr["PostCode"].ToString();
        oldNote.Value = Note.Text = dr["Note"].ToString();

    }



    protected void Update_Click(object sender, EventArgs e)
    {
        if (isChanged())
        {
            String sqlState;
            int result = 0;

            string DriverLicenseFileName;
            string SiteSafeFileName;

            string Path = HttpContext.Current.Request.MapPath("~/");
            if (DriverLicensePhoto.HasFile)
            {

                DriverLicenseFileName = Path + "Images/DriverLicense/DriverLicense_" + Forename.Text.Trim() + "_" + Surname.Text.Trim() + "_" + Email.Text.Trim() + ".jpg";
                DriverLicensePhoto.SaveAs(DriverLicenseFileName);
                DriverLicenseFileName = "~/Images/DriverLicense/DriverLicense_" + Forename.Text.Trim() + "_" + Surname.Text.Trim() + "_" + Email.Text.Trim() + ".jpg";
            }
            else
            {
                DriverLicenseFileName = DriverLicense.ImageUrl;
            }

            if (SiteSafePhoto.HasFile)
            {
                SiteSafeFileName = Path + "Images/SiteSafe/SiteSafe_" + Forename.Text.Trim() + "_" + Surname.Text.Trim() + "_" + Email.Text.Trim() + ".jpg";
                SiteSafePhoto.SaveAs(SiteSafeFileName);
                SiteSafeFileName = "~/Images/SiteSafe/SiteSafe_" + Forename.Text.Trim() + "_" + Surname.Text.Trim() + "_" + Email.Text.Trim() + ".jpg";
            }
            else
            {
                SiteSafeFileName = SiteSafe.ImageUrl;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            sqlState = "update EMPLOYEE set Forename = '" + Forename.Text.Trim()
                    + "', Surname = '" + Surname.Text.Trim()
                    //+ "', DOB = '" + DOB.Text.Trim()
                    + "', Position = '" + Position.Text.Trim()
                    //+ "', HireDate = '" + HireDate.Text.Trim()
                    //+ "', ResignDate = '" + ResignDate.Text.Trim()
                    + "', YearsInBCD = '" + YearsInBCD.Text.Trim()
                    + "', YearsInIndustry = '" + YearsInIndustry.Text.Trim()
                    + "', DriverLicenseNumber = '" + DriverLicenseNumber.Text.Trim()
                    + "', DriverLicenseClass = '" + DriverLicenseClass.Text.Trim()
                    //+ "', DriverLicenseExpiryDate = '" + DriverLicenseExpiryDate.Text.Trim()
                    + "', DriverLicensePhoto = '" + DriverLicenseFileName
                    + "', SiteSafePhoto = '" + SiteSafeFileName
                    + "', MobileNumber = '" + MobileNumber.Text.Trim()
                    + "', HomeNumber = '" + HomeNumber.Text.Trim()
                    + "', Email = '" + Email.Text.Trim()
                    + "', KinName = '" + KinName.Text.Trim()
                    + "', KinNumber = '" + KinNumber.Text.Trim()
                    + "', BankName = '" + BankName.Text.Trim()
                    + "', AccountNumber = '" + AccountNumber.Text.Trim()
                    + "', PayRate = '" + PayRate.Text.Trim()
                    + "', TaxRate = '" + TaxRate.Text.Trim()
                    + "', IRDNumber = '" + IRDNumber.Text.Trim()
                    + "', Country = '" + Country.Text.Trim()
                    + "', City = '" + City.Text.Trim()
                    + "', Suburb = '" + Suburb.Text.Trim()
                    + "', Street = '" + Street.Text.Trim()
                    + "', PostCode = '" + PostCode.Text.Trim()
                    + "', Note = '" + Note.Text.Trim()
                    + "' where EmployeeID = " + EmployeeID.Value;


            SqlCommand myCommand = new SqlCommand(sqlState, conn);
            myCommand.CommandType = CommandType.Text;

            conn.Open();

            result = myCommand.ExecuteNonQuery();
            conn.Close();
            if (result == 2)
            {
                ClientScript.RegisterStartupScript(typeof(string), "updateError", "<script>alert('Update Successfully!')</script>");

            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(string), "updateError", "<script>alert('Update Error!"+result+"')</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "nothingChanged", "<script>alert('Nothing Changed')</script>");
        }
    }

    private bool isChanged()
    {

        if (oldForename.Value != Forename.Text.Trim()
        || oldSurname.Value != Surname.Text.Trim()
        || oldDOB.Value != DOB.Text.Trim()
        || oldPosition.Value != Position.Text.Trim()
        || oldHireDate.Value != HireDate.Text.Trim()
        || oldResignDate.Value != ResignDate.Text.Trim()
        || oldYearsInBCD.Value != YearsInBCD.Text.Trim()
        || oldYearsInIndustry.Value != YearsInIndustry.Text.Trim()
        || oldDriverLicenseNumber.Value != DriverLicenseNumber.Text.Trim()
        || oldDriverLicenseClass.Value != DriverLicenseClass.Text.Trim()
        || oldDriverLicenseExpiryDate.Value != DriverLicenseExpiryDate.Text.Trim()
        || oldMobileNumber.Value != MobileNumber.Text.Trim()
        || oldHomeNumber.Value != HomeNumber.Text.Trim()
        || oldEmail.Value != Email.Text.Trim()
        || oldKinName.Value != KinName.Text.Trim()
        || oldKinNumber.Value != KinNumber.Text.Trim()
        || oldBankName.Value != BankName.Text.Trim()
        || oldAccountNumber.Value != AccountNumber.Text.Trim()
        || oldPayRate.Value != PayRate.Text.Trim()
        || oldTaxRate.Value != TaxRate.Text.Trim()
        || oldIRDNumber.Value != IRDNumber.Text.Trim()
        || oldCountry.Value != Country.Text.Trim()
        || oldCity.Value != City.Text.Trim()
        || oldSuburb.Value != Suburb.Text.Trim()
        || oldStreet.Value != Street.Text.Trim()
        || oldPostCode.Value != PostCode.Text.Trim()
        || oldNote.Value != Note.Text.Trim()
        || DriverLicensePhoto.HasFile
        || SiteSafePhoto.HasFile)
        {
            return true;
        }
        else
        {
            return false;
        }
       
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand myCommand = new SqlCommand("delete from EMPLOYEE where EmployeeID = "+EmployeeID.Value, conn);
        myCommand.CommandType = CommandType.Text;

        conn.Open();

        myCommand.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(typeof(string), "delete", "<script>alert('Delete successfully!')</script>");
    }
}