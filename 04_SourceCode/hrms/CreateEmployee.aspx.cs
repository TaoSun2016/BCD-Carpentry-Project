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

    }

    protected void Add_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;
 

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addEmployee", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Forname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Forname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Surname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DOB", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DOB.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Position", SqlDbType.VarChar,10);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Position.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HireDate", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = HireDate.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ResignDate", SqlDbType.VarChar,8);
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

        cmdParameter = new SqlParameter("@DriverLicenseNumber", SqlDbType.VarChar,30);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DriverLicenseNumber.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DriverLicenseClass", SqlDbType.VarChar, 10);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DriverLicenseClass.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DriverLicenseExpiryDate", SqlDbType.VarChar, 10);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DriverLicenseClass.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DriverLicensePhoto", SqlDbType.VarChar, 255);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = DriverLicensePhoto.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@SiteSafePhoto", SqlDbType.VarChar, 255);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = SiteSafePhoto.Text;
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
        cmdParameter.Value = Email.Text;
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

        cmdParameter = new SqlParameter("@IRDNumber", SqlDbType.VarChar,20);
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

        if (ErrCode != 0)
        {
            Response.Write("<script language='JavaScript'>alert('Add employee error!')</script>");
        }
        else
        {
            Response.Write("<script language='JavaScript'>alert('Add employee successfully!')</script>");
        }
        Clear_Fields();

    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        Clear_Fields();
    }

    private void Clear_Fields()
    {
        Forname.Text="";
        Surname.Text="";
        DOB.Text = "";
        Position.Text = "";
        HireDate.Text = "";
        ResignDate.Text = "";
        YearsInBCD.Text = "";
        YearsInIndustry.Text = "";
        DriverLicenseNumber.Text = "";
        DriverLicenseClass.Text = "";
        DriverLicenseClass.Text = "";
        DriverLicensePhoto.Text = "";
        SiteSafePhoto.Text = "";
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
}