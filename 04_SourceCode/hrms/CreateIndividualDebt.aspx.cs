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

        if ((Forename.Text.Trim() != "" || Surname.Text.Trim() != "")&&Email.Text.Trim() != "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not have value at the same time!')</script>");
        }
        if (Forename.Text.Trim() == "" && Surname.Text.Trim() == "" && Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not be null at the same time!')</script>");
        }

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addIndividualDebt", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Forename.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Surname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Email", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Email.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Date", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Date.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@INV", SqlDbType.VarChar, 30);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = INV.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Company", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Company.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Item", SqlDbType.VarChar, 60);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Item.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Amount", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Amount.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DeductionAmount", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Deduction.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WINZ", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = WINZ.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@IRD", SqlDbType.Decimal);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = IRD.Text;
        myCommand.Parameters.Add(cmdParameter);
        
        cmdParameter = new SqlParameter("@Description", SqlDbType.VarChar, 120);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Description.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);


        cmdParameter = new SqlParameter("@InvoiceFlag", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = InvoiceFlag.Checked ? 1 : 0;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ATPAFlag", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = ATPAFlag.Checked ? 1 : 0;
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
            ClearData();
        }
    }
    private void ClearData()
    {
        Forename.Text = "";
        Surname.Text = "";
        Email.Text = "";
        Date.Text = "";
        INV.Text = "";
        Company.Text = "";
        Item.Text = "";
        Amount.Text = "0.00";
        Deduction.Text = "0.00";
        Description.Text = "";
        WINZ.Text = "0.00";
        IRD.Text = "0.00";
        InvoiceFlag.Checked = false;
        ATPAFlag.Checked = false;
    }
}