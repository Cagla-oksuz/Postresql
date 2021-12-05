using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace denemeveritabanı
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
            //DataDoldur();
        }
        
       /* public void DataDoldur()
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=proje_20181215_003142; User Id=postgres; Password=admin;");
            DataSet dataSet = new DataSet();

            try
            {
                connection.Open();
            }

            catch (Exception ex)
            {
                throw;
            }

            string sql = "Select * From public.\"Urun\"";

            NpgsqlDataAdapter add = new NpgsqlDataAdapter(sql, connection);
            add.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
            connection.Close();
        }*/
    
        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //tedarik için
            /*SqlCommand cmd = new SqlCommand("select kolonadi from tabloadi", baglanti);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["Kolon_Adi"]);
            }*/
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            Tedarik();
            Tedarikci();
            Urun();

        }

        private void Tedarik()
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");

            NpgsqlCommand komut = new NpgsqlCommand();

            komut.CommandText = "SELECT * FROM public.\"Tedarik\"";
            komut.Connection = connection;

            NpgsqlDataReader dr;

            connection.Open();
            dr = komut.ExecuteReader();


            while (dr.Read())
            {
                comboBox1.Items.Add(dr["tedarikyeri"]);

            }

            connection.Close();

        }

        private void Tedarikci()
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");

            NpgsqlCommand komut = new NpgsqlCommand();

            komut.CommandText = "SELECT * FROM public.\"Tedarikci\"";
            komut.Connection = connection;

            NpgsqlDataReader dr;

            connection.Open();
            dr = komut.ExecuteReader();


            while (dr.Read())
            {
                comboBox2.Items.Add(dr["adi"]);
                

            }

            connection.Close();
        }

        private void Urun()
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");

            NpgsqlCommand komut = new NpgsqlCommand();

            komut.CommandText = "SELECT * FROM public.\"Urun\"";
            komut.Connection = connection;

            NpgsqlDataReader dr;

            connection.Open();
            dr = komut.ExecuteReader();


            while (dr.Read())
            {
                comboBox3.Items.Add(dr["urunid"]);


            }

            connection.Close();
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");

            try
            {

            }

            catch (Exception hata)
            {
                MessageBox.Show("İşlem Sırasında Hata Oluştu." + hata.Message);
            }


        }
    }
}
