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

    protected void Add_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;

        if (IsChanged())
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand myCommand = new SqlCommand("sp_addCertification", conn);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = EmployeeID.Value;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@CopyFlag", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = CopyFlag.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@LBP", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = LBP.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Expiry", SqlDbType.VarChar, 10);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Expiry.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@BCITONumber", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = BCITONumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@NZQANumber", SqlDbType.VarChar, 50);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = NZQANumber.Text;
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@FirstAid", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = FirstAid.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@FallArrest", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = FallArrest.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@ConfindSpaces", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = ConfindSpaces.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Ramset", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Ramset.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HILTI", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HILTI.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@LowScaff", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = LowScaff.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@WTR", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = WTR.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@EWP", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = EWP.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HIAB", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HIAB.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HT123", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HT123.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Dog", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Dog.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Crane", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Crane.Checked ? "1" : "0";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Chainsaw", SqlDbType.Int);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Chainsaw.Checked ? "1" : "0";
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
        else {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Nothing changed!')</script>");
        }

    }

    protected void Query_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;

        ClearData();
        if ((Q_Forename.Text.Trim() != "" || Q_Surname.Text.Trim() != "") && Q_Email.Text.Trim() != "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not have value at the same time!')</script>");
            return;
        }
        if (Q_Forename.Text.Trim() == "" && Q_Surname.Text.Trim() == "" && Q_Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "alert", "<script>alert('The Email and employee's name can not be null at the same time!')</script>");
            return;
        }

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_queryCertification", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Q_Forename", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Forename.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Q_Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Surname.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Q_Email", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Email.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        //////////////////////////////////////////////////////////
        cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@CopyFlag", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@LBP", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Expiry", SqlDbType.Date);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@BCITONumber", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@NZQANumber", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@FirstAid", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@FallArrest", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ConfindSpaces", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Ramset", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HILTI", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@LowScaff", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WTR", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@EWP", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HIAB", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HT123", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Dog", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Crane", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Chainsaw", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);


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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('" + ErrMsg + "')</script>");

        }
        else
        {
            EmployeeID.Value = myCommand.Parameters["@EmployeeID"].Value.ToString();
            oldExpiry.Value = Expiry.Text = myCommand.Parameters["@Expiry"].Value.ToString();
            oldBCITONumber.Value = BCITONumber.Text = myCommand.Parameters["@BCITONumber"].Value.ToString();
            oldNZQANumber.Value = NZQANumber.Text = myCommand.Parameters["@NZQANumber"].Value.ToString();

            if ((oldCopyFlag.Value = myCommand.Parameters["@CopyFlag"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldLBP.Value = myCommand.Parameters["@LBP"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldFirstAid.Value = myCommand.Parameters["@FirstAid"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldFallArrest.Value = myCommand.Parameters["@FallArrest"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldConfindSpaces.Value = myCommand.Parameters["@ConfindSpaces"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldRamset.Value = myCommand.Parameters["@Ramset"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldHILTI.Value = myCommand.Parameters["@HILTI"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldLowScaff.Value = myCommand.Parameters["@LowScaff"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldWTR.Value = myCommand.Parameters["@WTR"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldEWP.Value = myCommand.Parameters["@EWP"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldHIAB.Value = myCommand.Parameters["@HIAB"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldHT123.Value = myCommand.Parameters["@HT123"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }
            if ((oldDog.Value = myCommand.Parameters["@Dog"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldCrane.Value = myCommand.Parameters["@Crane"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldChainsaw.Value = myCommand.Parameters["@Chainsaw"].Value.ToString()) == "1")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }
            Add.Visible = true;
            Delete.Visible = true;
        }
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;


        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_deleteCertification", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = EmployeeID.Value;
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('Delete Error!')</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Delete successfully!')</script>");
            ClearData();
        }
    }

    private void ClearData()
    {
        EmployeeID.Value = "";
        CopyFlag.Checked = false;
        LBP.Checked = false;
        Expiry.Text = "";
        BCITONumber.Text = "";
        NZQANumber.Text = "";
        FirstAid.Checked = false;
        FallArrest.Checked = false;
        ConfindSpaces.Checked = false;
        Ramset.Checked = false;
        HILTI.Checked = false;
        LowScaff.Checked = false;
        WTR.Checked = false;
        EWP.Checked = false;
        HIAB.Checked = false;
        HT123.Checked = false;
        Dog.Checked = false;
        Crane.Checked = false;
        Chainsaw.Checked = false;
    }

    private bool IsChanged()
    {
        if (oldCopyFlag.Value != (CopyFlag.Checked ? "1" : "0")
          || oldBCITONumber.Value != BCITONumber.Text.Trim()
          || oldChainsaw.Value != (Chainsaw.Checked ? "1" : "0")
          || oldConfindSpaces.Value != (ConfindSpaces.Checked ? "1" : "0")
          || oldCrane.Value != (Crane.Checked ? "1" : "0")
          || oldDog.Value != (Dog.Checked?"1":"0")
          || oldEWP.Value != (EWP.Checked?"1":"0")
          || oldExpiry.Value != Expiry.Text.Trim()
          || oldFallArrest.Value != (FallArrest.Checked?"1":"0")
          || oldFirstAid.Value != (FirstAid.Checked?"1":"0")
          || oldHIAB.Value != (HIAB.Checked?"1":"0")
          || oldHILTI.Value != (HILTI.Checked?"1":"0")
          || oldHT123.Value != (HT123.Checked?"1":"0")
          || oldLBP.Value != (LBP.Checked?"1":"0")
          || oldLowScaff.Value != (LowScaff.Checked?"1":"0")
          || oldNZQANumber.Value != NZQANumber.Text.Trim()
          || oldRamset.Value != (Ramset.Checked?"1":"0")
          || oldWTR.Value != (WTR.Checked?"1":"0"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}