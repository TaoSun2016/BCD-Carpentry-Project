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

            cmdParameter = new SqlParameter("@CopyFlag", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = CopyFlag.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@LBP", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = LBP.Checked ? "Y" : "N";
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

            cmdParameter = new SqlParameter("@FirstAid", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = FirstAid.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@FallArrest", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = FallArrest.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@ConfindSpaces", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = ConfindSpaces.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Ramset", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Ramset.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HILTI", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HILTI.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@LowScaff", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = LowScaff.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@WTR", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = WTR.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@EWP", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = EWP.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HIAB", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HIAB.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@HT123", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = HT123.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Dog", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Dog.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Crane", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Crane.Checked ? "Y" : "N";
            myCommand.Parameters.Add(cmdParameter);

            cmdParameter = new SqlParameter("@Chainsaw", SqlDbType.Char, 1);
            cmdParameter.Direction = ParameterDirection.Input;
            cmdParameter.Value = Chainsaw.Checked ? "Y" : "N";
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

        cmdParameter = new SqlParameter("@CopyFlag", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@LBP", SqlDbType.Char, 1);
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

        cmdParameter = new SqlParameter("@FirstAid", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@FallArrest", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ConfindSpaces", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Ramset", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HILTI", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@LowScaff", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@WTR", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@EWP", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HIAB", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HT123", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Dog", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Crane", SqlDbType.Char, 1);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Chainsaw", SqlDbType.Char, 1);
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
            oldExpiry.Value = Expiry.Text = (myCommand.Parameters["@Expiry"].Value.ToString()=="")?"":((DateTime)myCommand.Parameters["@Expiry"].Value).ToString("yyyyMMdd");
            oldBCITONumber.Value = BCITONumber.Text = myCommand.Parameters["@BCITONumber"].Value.ToString();
            oldNZQANumber.Value = NZQANumber.Text = myCommand.Parameters["@NZQANumber"].Value.ToString();

            if ((oldCopyFlag.Value = myCommand.Parameters["@CopyFlag"].Value.ToString()) == "Y")
            {
                CopyFlag.Checked = true;
            }
            else
            {
                CopyFlag.Checked = false;
            }

            if ((oldLBP.Value = myCommand.Parameters["@LBP"].Value.ToString()) == "Y")
            {
                LBP.Checked = true;
            }
            else
            {
                LBP.Checked = false;
            }

            if ((oldFirstAid.Value = myCommand.Parameters["@FirstAid"].Value.ToString()) == "Y")
            {
                FirstAid.Checked = true;
            }
            else
            {
                FirstAid.Checked = false;
            }

            if ((oldFallArrest.Value = myCommand.Parameters["@FallArrest"].Value.ToString()) == "Y")
            {
                FallArrest.Checked = true;
            }
            else
            {
                FallArrest.Checked = false;
            }

            if ((oldConfindSpaces.Value = myCommand.Parameters["@ConfindSpaces"].Value.ToString()) == "Y")
            {
                ConfindSpaces.Checked = true;
            }
            else
            {
                ConfindSpaces.Checked = false;
            }

            if ((oldRamset.Value = myCommand.Parameters["@Ramset"].Value.ToString()) == "Y")
            {
                Ramset.Checked = true;
            }
            else
            {
                Ramset.Checked = false;
            }

            if ((oldHILTI.Value = myCommand.Parameters["@HILTI"].Value.ToString()) == "Y")
            {
                HILTI.Checked = true;
            }
            else
            {
                HILTI.Checked = false;
            }

            if ((oldLowScaff.Value = myCommand.Parameters["@LowScaff"].Value.ToString()) == "Y")
            {
                LowScaff.Checked = true;
            }
            else
            {
                LowScaff.Checked = false;
            }

            if ((oldWTR.Value = myCommand.Parameters["@WTR"].Value.ToString()) == "Y")
            {
                WTR.Checked = true;
            }
            else
            {
                WTR.Checked = false;
            }

            if ((oldEWP.Value = myCommand.Parameters["@EWP"].Value.ToString()) == "Y")
            {
                EWP.Checked = true;
            }
            else
            {
                EWP.Checked = false;
            }

            if ((oldHIAB.Value = myCommand.Parameters["@HIAB"].Value.ToString()) == "Y")
            {
                HIAB.Checked = true;
            }
            else
            {
                HIAB.Checked = false;
            }

            if ((oldHT123.Value = myCommand.Parameters["@HT123"].Value.ToString()) == "Y")
            {
                HT123.Checked = true;
            }
            else
            {
                HT123.Checked = false;
            }
            if ((oldDog.Value = myCommand.Parameters["@Dog"].Value.ToString()) == "Y")
            {
                Dog.Checked = true;
            }
            else
            {
                Dog.Checked = false;
            }

            if ((oldCrane.Value = myCommand.Parameters["@Crane"].Value.ToString()) == "Y")
            {
                Crane.Checked = true;
            }
            else
            {
                Crane.Checked = false;
            }

            if ((oldChainsaw.Value = myCommand.Parameters["@Chainsaw"].Value.ToString()) == "Y")
            {
                Chainsaw.Checked = true;
            }
            else
            {
                Chainsaw.Checked = false;
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
            //ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('delete error!')</script>");

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
        if (oldCopyFlag.Value != (CopyFlag.Checked ? "Y":"N")
          || oldBCITONumber.Value != BCITONumber.Text.Trim()
          || oldChainsaw.Value != (Chainsaw.Checked ? "Y":"N")
          || oldConfindSpaces.Value != (ConfindSpaces.Checked ? "Y":"N")
          || oldCrane.Value != (Crane.Checked ? "Y":"N")
          || oldDog.Value != (Dog.Checked?"Y":"N")
          || oldEWP.Value != (EWP.Checked?"Y":"N")
          || oldExpiry.Value != Expiry.Text.Trim()
          || oldFallArrest.Value != (FallArrest.Checked?"Y":"N")
          || oldFirstAid.Value != (FirstAid.Checked?"Y":"N")
          || oldHIAB.Value != (HIAB.Checked?"Y":"N")
          || oldHILTI.Value != (HILTI.Checked?"Y":"N")
          || oldHT123.Value != (HT123.Checked?"Y":"N")
          || oldLBP.Value != (LBP.Checked?"Y":"N")
          || oldLowScaff.Value != (LowScaff.Checked?"Y":"N")
          || oldNZQANumber.Value != NZQANumber.Text.Trim()
          || oldRamset.Value != (Ramset.Checked?"Y":"N")
          || oldWTR.Value != (WTR.Checked?"Y":"N"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void ImageButtonExpiry_Click(object sender, ImageClickEventArgs e)
    {
        if (CalendarExpiry.Visible == true)
        {
            CalendarExpiry.Visible = false;
        }
        else
        {
            CalendarExpiry.Visible = true;
        }
    }

    protected void CalendarExpiry_SelectionChanged(object sender, EventArgs e)
    {
        Expiry.Text = CalendarExpiry.SelectedDate.ToString("yyyyMMdd");
        CalendarExpiry.Visible = false;
    }
}