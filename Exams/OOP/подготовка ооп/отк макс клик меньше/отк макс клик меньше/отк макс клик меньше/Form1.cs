using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace отк_макс_клик_меньше
{

    public partial class Form1 : Form
    {
        int maxHeight;
        int maxWidth;
        public Form1()
        {
            InitializeComponent();
            maxHeight = this.Height;
            maxWidth = this.Width;
        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            { this.Height = maxHeight; 
                this.Width = maxWidth;
            }

            if (e.Button == MouseButtons.Left)
            {
                this.Size = new Size((int)(this.Width * 0.5), (int)(this.Height * 0.5));
            }

        }
    }
}
