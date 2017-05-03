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

        SqlCommand myCommand = new SqlCommand("sp_addVehicle", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@RegisterNumber", SqlDbType.VarChar, 10);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = RegisterNumber.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WOFDueDate", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = WOFDueDate.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ServiceDue", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = ServiceDue.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@REGODueDate", SqlDbType.VarChar,8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = REGODueDate.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@FuelCardNumber", SqlDbType.VarChar,30);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = FuelCardNumber.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@GPSSerialNumber", SqlDbType.VarChar,60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = GPSSerialNumber.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@SIMCardNumber", SqlDbType.VarChar,60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = SIMCardNumber.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@SaleAgreement", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = SaleAgreement.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@OwnershipChanged", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = OwnershipChanged.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Insured", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Insured.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@GPSInstalled", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = GPSInstalled.Checked ? 1 : 0;
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Add Error!')</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Add successfully!')</script>");
        }
    }
}