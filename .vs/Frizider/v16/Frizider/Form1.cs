using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Frizider
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        string cs = @"Data source = DESKTOP-HLB8M6E\SQLEXPRESS; Initial catalog = frizider; Integrated security = true";
        SqlConnection veza;
        SqlDataAdapter adapter;
        DataTable podaci;
        
        private void Form1_Load(object sender, EventArgs e)
        {
            veza = new SqlConnection(cs);
            adapter = new SqlDataAdapter("select * from Pogled", veza);
            podaci = new DataTable();
            adapter.Fill(podaci);
            dataGridView1.DataSource = podaci;
            dataGridView1.ReadOnly = true;
            dataGridView1.AllowUserToAddRows = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string kategorija = textBox2.Text.ToLower();
            string proizvodjac = textBox1.Text.ToLower();
            string naredba = $"select * from pogled where lower(Proizvodjac) like '%{proizvodjac}%' AND lower(Kategorija) like '%{kategorija}%';";
            adapter = new SqlDataAdapter(naredba, veza);
            podaci.Clear();
            podaci = new DataTable();
            adapter.Fill(podaci);
            dataGridView1.DataSource = podaci;
        }
    }
}
