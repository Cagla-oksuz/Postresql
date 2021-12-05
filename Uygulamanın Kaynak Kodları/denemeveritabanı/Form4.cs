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
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");
        

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*connection.Open();
            string ulke = "Select ulke From public.\"Ulke\"";

           
            NpgsqlDataAdapter add = new NpgsqlDataAdapter(ulke, connection);
            add.Fill(dataSet);

            comboBox4.DataSource = dataSet.
            connection.Close();

            //dataGridView1.DataSource = dataSet.Tables[0];
            //connection.Close(); */
        }

        private void button1_Click(object sender, EventArgs e)
        {

            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                
                string kayit = "insert into public.\"Tedarikci\"(adi, soyadi, kisiid, kisituru, iletisimid) values (@adi,@soyadi,@kisiid,@kisituru,@iletisimid::int)";
 

                NpgsqlCommand komut = new NpgsqlCommand(kayit, connection);
                
                komut.Parameters.AddWithValue("@adi", textBox1.Text);
                komut.Parameters.AddWithValue("@soyadi", textBox2.Text);
                komut.Parameters.AddWithValue("@kisiid", numericUpDown1.Value);
                komut.Parameters.AddWithValue("@kisituru", textBox3.Text);
                komut.Parameters.AddWithValue("@iletisimid", comboBox1.Text);


                komut.ExecuteNonQuery();
                connection.Close();

                MessageBox.Show("Kayıt eklendi.", "Bilgilendirme");
            }

            catch (Exception hata)
            {
                MessageBox.Show("İşlem Sırasında Hata Oluştu." + hata.Message);
            }

            
        }

        private void TedarikciEkle(object sender, EventArgs e)
        {

        }

 
        public void tedarikciSirala()
        {
            /*string sql = "Select adi  From public.\"Tedarikci\"";

            NpgsqlDataAdapter add = new NpgsqlDataAdapter(sql, connection);
            add.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
            connection.Close();
            */

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form4_Load(object sender, EventArgs e)
        {
            IletisimID();

            DataSet dataSet = new DataSet();

            try
            {
                connection.Open();
            }

            catch (Exception ex)
            {
                throw;
            }

            string sql = "Select iletisimid, telefon, faks, mail From public.\"IletisimBilgileri\"";


            NpgsqlDataAdapter add = new NpgsqlDataAdapter(sql, connection);
            add.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
            connection.Close();
        }

        private void IletisimID()
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veritabanıproje; User Id=postgres; Password=admin;");

            NpgsqlCommand komut = new NpgsqlCommand();

            komut.CommandText = "SELECT * FROM public.\"IletisimBilgileri\"";
            komut.Connection = connection;

            NpgsqlDataReader dr;

            connection.Open();
            dr = komut.ExecuteReader();


            while (dr.Read())
            {
                comboBox1.Items.Add(dr["iletisimid"]);

            }

            connection.Close();

        }

       
        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
