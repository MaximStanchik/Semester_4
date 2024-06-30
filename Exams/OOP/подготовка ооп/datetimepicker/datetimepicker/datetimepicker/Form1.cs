using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace datetimepicker
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "dd.MM.yyyy HH:mm";

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            DateTime SelectedTime = dateTimePicker1.Value;
            string message = SelectedTime.Hour < 12 ? "До полудня" : "После полудня";
            toolStripStatusLabel1.Text = message;
        }

        private void button1_Click(object sender, EventArgs e)
        {
           dateTimePicker1.Value = dateTimePicker1.Value.AddDays(10);
        }
    }
}
