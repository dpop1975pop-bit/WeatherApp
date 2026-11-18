namespace WeatherApp
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.txtCityName = new System.Windows.Forms.TextBox();
            this.btnAddCity = new System.Windows.Forms.Button();
            this.btnCurrentWeather = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // comboBox3
            // 
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Items.AddRange(new object[] {
            "Наблюдения",
            "Прогнозы",
            "Города",
            "Страны",
            "Источники",
            "Категории",
            "Значения показателей",
            "Единицы измерения",
            "Пользователи",
            "Избранные локации"});
            this.comboBox3.Location = new System.Drawing.Point(0, 0);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(180, 24);
            this.comboBox3.TabIndex = 0;
            this.comboBox3.Text = "Загрузить таблицу";
            this.comboBox3.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(186, 0);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowHeadersWidth = 51;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.Size = new System.Drawing.Size(1514, 434);
            this.dataGridView2.TabIndex = 1;
            // 
            // txtCityName
            // 
            this.txtCityName.Location = new System.Drawing.Point(12, 212);
            this.txtCityName.Name = "txtCityName";
            this.txtCityName.Size = new System.Drawing.Size(100, 22);
            this.txtCityName.TabIndex = 2;
            // 
            // btnAddCity
            // 
            this.btnAddCity.Location = new System.Drawing.Point(0, 30);
            this.btnAddCity.Name = "btnAddCity";
            this.btnAddCity.Size = new System.Drawing.Size(180, 59);
            this.btnAddCity.TabIndex = 3;
            this.btnAddCity.Text = "Добавить город";
            this.btnAddCity.UseVisualStyleBackColor = true;
            this.btnAddCity.Click += new System.EventHandler(this.btnAddCity_Click);
            // 
            // btnCurrentWeather
            // 
            this.btnCurrentWeather.Location = new System.Drawing.Point(0, 110);
            this.btnCurrentWeather.Name = "btnCurrentWeather";
            this.btnCurrentWeather.Size = new System.Drawing.Size(180, 58);
            this.btnCurrentWeather.TabIndex = 4;
            this.btnCurrentWeather.Text = "Текущая погода";
            this.btnCurrentWeather.UseVisualStyleBackColor = true;
            this.btnCurrentWeather.Click += new System.EventHandler(this.btnCurrentWeather_Click);
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(840, 552);
            this.Controls.Add(this.btnCurrentWeather);
            this.Controls.Add(this.btnAddCity);
            this.Controls.Add(this.txtCityName);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.comboBox3);
            this.Name = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.TextBox txtCityName;
        private System.Windows.Forms.Button btnAddCity;
        private System.Windows.Forms.Button btnCurrentWeather;
    }
}

