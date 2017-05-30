using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;


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
        Forename.Value = "";
        Surname.Value = "";
        Position.Text = "";
        OtherPositions.Text = "";
        Qualifications.Text = "";
        HireDate.Text = "";
        YearsInIndustry.Text = "";
        DriverLicenseClass.Text = "";
        SiteSafe.ImageUrl = "";
        GeneralCompetency.SelectedIndex = 0;
        ToolCompetency.SelectedIndex = 0;
    }

    protected void Query_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;

        Clear_Fields();
        if (Q_Forename.Text.Trim() == "" && Q_Surname.Text.Trim() == ""
         && Q_Email.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('Must input at least one query condition!')</script>");
            return;
        }


        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

       

        SqlCommand myCommand = new SqlCommand("sp_queryCompetency", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@Q_ForeName", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Forename.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Q_Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Surname.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Q_Email", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Q_Email.Text;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Forename", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Surname", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Position", SqlDbType.VarChar,10);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@HireDate", SqlDbType.Date);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@YearsInIndustry", SqlDbType.Int);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@DriverLicenseClass", SqlDbType.VarChar,10);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@SiteSafePhoto", SqlDbType.VarChar, 255);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Qualifications", SqlDbType.VarChar, 1024);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@GeneralCompetency", SqlDbType.VarChar, 7);
        cmdParameter.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ToolCompetency", SqlDbType.VarChar, 7);
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

        if (ErrCode != 0)
        {
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");
        }
        else
        {
            EmployeeID.Value = myCommand.Parameters["@EmployeeID"].Value.ToString();
            Forename.Value = myCommand.Parameters["@Forename"].Value.ToString();
            Surname.Value = myCommand.Parameters["@Surname"].Value.ToString();
            Position.Text = (string)myCommand.Parameters["@Position"].Value;
            HireDate.Text = ((DateTime)(myCommand.Parameters["@HireDate"].Value)).ToString("yyyymmdd");
            YearsInIndustry.Text = myCommand.Parameters["@YearsInIndustry"].Value.ToString();
            SiteSafe.ImageUrl = myCommand.Parameters["@SiteSafePhoto"].Value.ToString();
            Qualifications.Text = (string)myCommand.Parameters["@Qualifications"].Value;
            GeneralCompetency.Text = (string)myCommand.Parameters["@GeneralCompetency"].Value;
            ToolCompetency.Text = (string)myCommand.Parameters["@ToolCompetency"].Value;
            Add.Visible = true;
            Delete.Visible = true;
            Export.Visible = true;
        }
        conn.Close();
    }

    protected void Add_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;


        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_addCompetency", conn);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter cmdParameter = new SqlParameter("@EmployeeID", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = EmployeeID.Value;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@Qualifications", SqlDbType.VarChar, 50);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = Qualifications.Text.Trim();
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@GeneralCompetency", SqlDbType.VarChar, 100);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = GeneralCompetency.SelectedValue;
        myCommand.Parameters.Add(cmdParameter);

        cmdParameter = new SqlParameter("@ToolCompetency", SqlDbType.VarChar, 8);
        cmdParameter.Direction = ParameterDirection.Input;
        cmdParameter.Value = ToolCompetency.SelectedValue;
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");

        }
        else
        {
            Clear_Fields();
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('"+ErrMsg+"')</script>");         
        }
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        int ErrCode;
        string ErrMsg;


        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        SqlCommand myCommand = new SqlCommand("sp_deleteCompetency", conn);
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
            ClientScript.RegisterStartupScript(typeof(string), "error", "<script>alert('"+ErrMsg+"')</script>");
        }
        else
        {
            Clear_Fields();
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('"+ErrMsg+"')</script>");
        }

    }

    protected void Export_Click(object sender, EventArgs e)
    {
        try
        {
            string FilePaht = "D:\\tmp\\";
            string FileName = Forename.Value + "_" + Surname.Value + DateTime.Now.ToString("_yyyyMMdd") + ".pdf";
            Document document = new Document();
            //PdfWriter.GetInstance(document, new FileStream(Server.MapPath("Test.pdf"), FileMode.Create));
            PdfWriter.GetInstance(document, new FileStream(FilePaht+FileName, FileMode.Create));

            document.Open();
            //BaseFont bfChinese = BaseFont.CreateFont("C:\\WINDOWS\\Fonts\\simsun.ttc,1", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            //Font fontChinese = new Font(bfChinese, 12, Font.NORMAL, new Color(0, 0, 0));

            //Header
            Paragraph Herder = new Paragraph("The information contained in this document is confidential, privileged and only for the information of the intended receipient. It may not be used, published or redistributed without the prior written consent of BCD Carpentry Ltd.", FontFactory.GetFont(FontFactory.TIMES_ROMAN, 8));
            Herder.Alignment = Element.ALIGN_CENTER;
            document.Add(Herder);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Company name
            Chunk bcd = new Chunk("BCD",FontFactory.GetFont(FontFactory.HELVETICA_BOLD,18,BaseColor.RED));
            Chunk carpentry = new Chunk("Carpentry", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLUE));
            Chunk ltd = new Chunk("LTD", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK));
            Paragraph CompanyName = new Paragraph();

            CompanyName.Add(bcd);
            CompanyName.Add(carpentry);
            CompanyName.Add(ltd);
            CompanyName.Alignment = Element.ALIGN_CENTER;
            document.Add(CompanyName);

            //Title
            Paragraph Title = new Paragraph("RECORD OF COMPETENCY", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14));
            Title.Alignment = Element.ALIGN_CENTER;
            document.Add(Title);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Name and Photo
            Paragraph Name = new Paragraph(Forename.Value + " " + Surname.Value, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLACK));
            document.Add(Name);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            if (SiteSafe.ImageUrl!="")
            {
                iTextSharp.text.Image Image = iTextSharp.text.Image.GetInstance(Server.MapPath(SiteSafe.ImageUrl));
                Image.ScaleAbsolute(180, 120);
                document.Add(Image);
                document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            }


            //Position
            Chunk PositionTitle = new Chunk("POSITION HELD WITHIN BCD:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk PositionContent1 = new Chunk(Position.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Paragraph Position1 = new Paragraph();
            Position1.Add(PositionTitle);
            Position1.Add(PositionContent1);
            document.Add(Position1);
            Chunk PositionContent2 = new Chunk("                                                      " + Position.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            document.Add(new Paragraph(PositionContent2));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Years
            Chunk YearStartTitle = new Chunk("YEARS STARTED WITH BCD:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk YearStartContent = new Chunk(HireDate.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Chunk YearsTitle = new Chunk("          YEARS IN INDUSTRY:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk YearsContent = new Chunk(YearsInIndustry.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Paragraph Years = new Paragraph();
            Years.Add(YearStartTitle);
            Years.Add(YearStartContent);
            Years.Add(YearsTitle);
            Years.Add(YearsContent);
            document.Add(Years);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Qualifications
            Chunk QualificationsTitle = new Chunk("QUALIFICATIONS GAINED:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            document.Add(new Paragraph(QualificationsTitle));
            Paragraph QualificationsContent = new Paragraph(Qualifications.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            QualificationsContent.Alignment = Element.ALIGN_CENTER;
            document.Add(QualificationsContent);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Driver License Class
            Chunk DriverLicenseTitle = new Chunk("DRIVER LICENSE ENDORSEMENTS:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk DriverLicenseContent = new Chunk(DriverLicenseClass.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            document.Add(DriverLicenseTitle);
            document.Add(DriverLicenseContent);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Competency
            Chunk GeneralTitle = new Chunk("GENERAL COMPETENCY:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk GeneralContent = new Chunk(GeneralCompetency.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Chunk ToolTitle = new Chunk("          TOOL COMPETENCY:  ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLUE));
            Chunk ToolContent = new Chunk(ToolCompetency.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Paragraph Compentency = new Paragraph();
            Compentency.Add(GeneralTitle);
            Compentency.Add(GeneralContent);
            Compentency.Add(ToolTitle);
            Compentency.Add(ToolContent);
            document.Add(Compentency);
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));


            //Signature
            document.Add(new Paragraph("SIGNED:                                                           DATE:", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));
            document.Add(new Paragraph(" ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK)));

            //Footer
            Paragraph Footer1 = new Paragraph("GREG DUNN - DIRECTOR - PH:(027)478-1696", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK));
            Footer1.Alignment = Element.ALIGN_CENTER;
            document.Add(Footer1);

            //Company
            Chunk FooterBCD = new Chunk("BCD ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.RED));
            Chunk FooterCarpentry = new Chunk("Carpentry ", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.BLUE));
            Chunk FooterLtd = new Chunk("LTD", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.BLACK));
            Paragraph FooterCompany = new Paragraph();
            FooterCompany.Add(FooterBCD);
            FooterCompany.Add(FooterCarpentry);
            FooterCompany.Add(FooterLtd);
            FooterCompany.Alignment = Element.ALIGN_RIGHT;
            document.Add(FooterCompany);

            //Address
            Paragraph FooterAddress1 = new Paragraph("13 SOMBRERO VIEW", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.BLACK));
            Paragraph FooterAddress2 = new Paragraph("ASCOT PARK", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.BLACK));
            Paragraph FooterAddress3 = new Paragraph("PORIRUA, 5024", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8, BaseColor.BLACK));
            FooterAddress1.Alignment = Element.ALIGN_RIGHT;
            FooterAddress2.Alignment = Element.ALIGN_RIGHT;
            FooterAddress3.Alignment = Element.ALIGN_RIGHT;
            document.Add(FooterAddress1);
            document.Add(FooterAddress2);
            document.Add(FooterAddress3);


            document.Close();
            //Response.Write("<script>alert('Export successfully！');</script>");
            ClientScript.RegisterStartupScript(typeof(string), "success", "<script>alert('Export successfully！')</script>");
        }
        catch (DocumentException de)
        {
            Response.Write(de.ToString());
        }

    }
}