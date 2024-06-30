using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace даблклик_в_другой_список
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            string x = listBox1.SelectedItem.ToString();
           listBox1.Items.Remove(x);
            listBox2.Items.Add(x);
            }
    }
}
