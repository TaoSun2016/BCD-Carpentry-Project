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
        oldOtherPositions.Value = "";
        oldHireDate.Value = "";
        oldResignDate.Value = "";
        oldYearsInBCD.Value = "";
        oldYearsInIndustry.Value = "";
        oldDriverLicenseNumber.Value = "";
        oldSiteSafeNumber.Value = "";
        oldDriverLicenseClass.Value = "";
        oldDriverLicenseExpiryDate.Value = "";
        oldSiteSafeExpiryDate.Value = "";
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
        Position.SelectedIndex = 0;
        OtherPositions.Text = "";
        HireDate.Text = "";
        ResignDate.Text = "";
        YearsInBCD.Text = "";
        YearsInIndustry.Text = "";
        DriverLicenseNumber.Text = "";
        SiteSafeNumber.Text = "";
        DriverLicenseClass.Text = "";
        DriverLicenseExpiryDate.Text = "";
        SiteSafeExpiryDate.Text = "";
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
                //Response.Write("<script language='JavaScript'>alert(''Can not find the employee's information!')</script>");

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
        oldDOB.Value = DOB.Text = ((DateTime)dr["DOB"]).ToString("yyyyMMdd");
        oldPosition.Value = Position.SelectedValue = dr["Position"].ToString();
        oldOtherPositions.Value = OtherPositions.Text = dr["OtherPositions"].ToString();
        oldHireDate.Value = HireDate.Text = ((DateTime)dr["HireDate"]).ToString("yyyyMMdd");
        oldResignDate.Value = ResignDate.Text = (dr["ResignDate"].ToString()=="")?"":((DateTime)dr["ResignDate"]).ToString("yyyyMMdd");
        oldYearsInBCD.Value = YearsInBCD.Text = dr["YearsInBCD"].ToString();
        oldYearsInIndustry.Value = YearsInIndustry.Text = dr["YearsInIndustry"].ToString();
        oldDriverLicenseNumber.Value = DriverLicenseNumber.Text = dr["DriverLicenseNumber"].ToString();
        oldSiteSafeNumber.Value = SiteSafeNumber.Text = dr["SiteSafeNumber"].ToString();
        oldDriverLicenseClass.Value = DriverLicenseClass.Text = dr["DriverLicenseClass"].ToString();
        oldDriverLicenseExpiryDate.Value = DriverLicenseExpiryDate.Text = (dr["DriverLicenseExpiryDate"].ToString()=="")?"": ((DateTime)dr["DriverLicenseExpiryDate"]).ToString("yyyyMMdd");
        oldSiteSafeExpiryDate.Value = SiteSafeExpiryDate.Text = (dr["SiteSafeExpiryDate"].ToString() == "") ? "" : ((DateTime)dr["SiteSafeExpiryDate"]).ToString("yyyyMMdd");
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
            int ErrCode;
            string ErrMsg;

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

            SqlCommand myCommand = new SqlCommand("sp_updateEmployee", conn);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = EmployeeID.Value;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Forename.Text.Trim();
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Surname.Text.Trim();
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@DOB", SqlDbType.VarChar, 8);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = DOB.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Position", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Position.SelectedValue;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@OtherPositions", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = OtherPositions.Text.Trim();
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HireDate", SqlDbType.VarChar, 8);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HireDate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@ResignDate", SqlDbType.VarChar, 8);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = ResignDate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@YearsInBCD", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = YearsInBCD.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@YearsInIndustry", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = YearsInIndustry.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@DriverLicenseNumber", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = DriverLicenseNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@SiteSafeNumber", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = SiteSafeNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@DriverLicenseClass", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = DriverLicenseClass.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@DriverLicenseExpiryDate", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = DriverLicenseExpiryDate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@SiteSafeExpiryDate", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = SiteSafeExpiryDate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@DriverLicensePhoto", SqlDbType.VarChar, 255);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = DriverLicenseFileName;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@SiteSafePhoto", SqlDbType.VarChar, 255);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = SiteSafeFileName;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@MobileNumber", SqlDbType.VarChar, 20);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = MobileNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HomeNumber", SqlDbType.VarChar, 20);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HomeNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Email", SqlDbType.VarChar, 100);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Email.Text.Trim();
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@KinName", SqlDbType.VarChar, 100);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = KinName.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@KinNumber", SqlDbType.VarChar, 20);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = KinNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@BankName", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = BankName.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@AccountNumber", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = AccountNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@PayRate", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = PayRate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@TaxRate", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = TaxRate.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@IRDNumber", SqlDbType.VarChar, 20);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = IRDNumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Country", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Country.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@City", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = City.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Suburb", SqlDbType.VarChar, 30);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Suburb.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Street", SqlDbType.VarChar, 100);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Street.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@PostCode", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = PostCode.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Note", SqlDbType.VarChar, 255);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Note.Text;
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

            //Response.Write("<script language='JavaScript'>alert('"+ErrMsg+"')</script>");
            ClientScript.RegisterStartupScript(typeof(string), "nochange", "<script>alert('" + ErrMsg + "')</script>");
            Clear_Fields();
        }
        else
        {
            //Response.Write("<script language='JavaScript'>alert('Nothing changed')</script>");
            ClientScript.RegisterStartupScript(typeof(string), "nochange", "<script>alert('Nothing changed')</script>");
        }
    }

    private bool isChanged()
    {

        if (oldForename.Value != Forename.Text.Trim()
        || oldSurname.Value != Surname.Text.Trim()
        || oldDOB.Value != DOB.Text.Trim()
        || oldPosition.Value != Position.SelectedValue.Trim()
        || oldOtherPositions.Value != OtherPositions.Text.Trim()
        || oldHireDate.Value != HireDate.Text.Trim()
        || oldResignDate.Value != ResignDate.Text.Trim()
        || oldYearsInBCD.Value != YearsInBCD.Text.Trim()
        || oldYearsInIndustry.Value != YearsInIndustry.Text.Trim()
        || oldDriverLicenseNumber.Value != DriverLicenseNumber.Text.Trim()
        || oldSiteSafeNumber.Value != SiteSafeNumber.Text.Trim()
        || oldDriverLicenseClass.Value != DriverLicenseClass.Text.Trim()
        || oldDriverLicenseExpiryDate.Value != DriverLicenseExpiryDate.Text.Trim()
        || oldSiteSafeExpiryDate.Value != SiteSafeExpiryDate.Text.Trim()
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
        SqlCommand myCommand = new SqlCommand("Update EMPLOYEE set EmployeeStatus='N' where EmployeeID = "+EmployeeID.Value, conn);
        myCommand.CommandType = CommandType.Text;

        conn.Open();

        myCommand.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(typeof(string), "delete", "<script>alert('Delete successfully!')</script>");
        Clear_Fields();
    }

    protected void ImageButtonDOB_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarDOB.Visible == true)
        {
            CalendarDOB.Visible = false;
        }
        else
        {
            CalendarDOB.Visible = true;
        }
    }
    protected void CalendarDOB_SelectionChanged(object sender, EventArgs e)
    {
        DOB.Text = CalendarDOB.SelectedDate.ToString("yyyyMMdd");
        CalendarDOB.Visible = false;
    }


    protected void ImageButtonHireDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarHireDate.Visible == true)
        {
            CalendarHireDate.Visible = false;
        }
        else
        {
            CalendarHireDate.Visible = true;
        }
    }

    protected void CalendarHireDate_SelectionChanged(object sender, EventArgs e)
    {
        HireDate.Text = CalendarHireDate.SelectedDate.ToString("yyyyMMdd");
        CalendarHireDate.Visible = false;
    }

    protected void ImageButtonResignDate_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarResignDate.Visible == true)
        {
            CalendarResignDate.Visible = false;
        }
        else
        {
            CalendarResignDate.Visible = true;
        }
    }

    protected void CalendarResignDate_SelectionChanged(object sender, EventArgs e)
    {
        ResignDate.Text = CalendarResignDate.SelectedDate.ToString("yyyyMMdd");
        CalendarResignDate.Visible = false;
    }

    protected void ImageButtonDriverLicense_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarDriverLicense.Visible == true)
        {
            CalendarDriverLicense.Visible = false;
        }
        else
        {
            CalendarDriverLicense.Visible = true;
        }
    }

    protected void CalendarDriverLicense_SelectionChanged(object sender, EventArgs e)
    {
        DriverLicenseExpiryDate.Text = CalendarDriverLicense.SelectedDate.ToString("yyyyMMdd");
        CalendarDriverLicense.Visible = false;
    }

    protected void ImageButtonSiteSafe_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarSiteSafe.Visible == true)
        {
            CalendarSiteSafe.Visible = false;
        }
        else
        {
            CalendarSiteSafe.Visible = true;
        }
    }

    protected void CalendarSiteSafe_SelectionChanged(object sender, EventArgs e)
    {
        SiteSafeExpiryDate.Text = CalendarSiteSafe.SelectedDate.ToString("yyyyMMdd");
        CalendarSiteSafe.Visible = false;
    }

}