#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDir>
#include <QList>
#include <QFileInfoList>
#include <QTextCodec>
#include <QProcess>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    //设置编码 - deprecated
    //QTextCodec *codec = QTextCodec::codecForName("UTF-8");
    //QTextCodec::setCodecForLocale(codec);
    //QTextCodec::setCodecForCStrings(codec);
    //QTextCodec::setCodecForTr(codec);
    //处理分类列表
    QDir dir_script_category("scripts");
    dir_script_category.setFilter(QDir::Dirs | QDir::NoSymLinks);//列出文件,列出隐藏文件（在Unix下就是以.开始的为文件）,不列出符号链接（不支持符号连接的操作系统会忽略）
    dir_script_category.setSorting(QDir::Size | QDir::Reversed);//按文件大小排序，相反的排序顺序
    const QFileInfoList list_script_category = dir_script_category.entryInfoList();//返回这个目录中所有目录和文件的QFileInfo对象的列表
    QFileInfoList::const_iterator iterator_script_category = list_script_category.begin();
    qDebug() << "目录和文件的数量: " << dir_script_category.count();//返回找到的目录和文件的数量
    qDebug() << "fileName/t/t/tsize/t/t/t";
    while(iterator_script_category != list_script_category.end()){
        if(!(*iterator_script_category).fileName().startsWith('.'))
        {
            ui->listWidget_script_category->addItem((*iterator_script_category).fileName());
            qDebug() << (*iterator_script_category).fileName()<<"/t/t/t"<<(*iterator_script_category).size();
        }
        iterator_script_category++;
    }
    qDebug() << "当前目录: " << dir_script_category.current();//返回应用程序当前目录。
    qDebug() << "当前目录的绝对路径" << dir_script_category.currentPath();//返回应用程序当前目录的绝对路径。
    //    const QList<QString> list = d.entryList(); //返回这个目录中所有目录和文件的名称的列表
    //    QList<QString>::const_iterator iterator = list.begin();
    //    while(iterator != list.end()){
    //        qDebug() << (*iterator);
    //        iterator++;
    //    }
    //处理脚本展示

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QString desc("");
    QFile file("desc/"+ui->listWidget_script_category->currentItem()->text()+"/"+ui->listWidget_script_root->currentItem()->text()+".desc");
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug()<<"Can't open the file!"<<endl;
    }
    while(!file.atEnd()) {
        QByteArray line = file.readLine();
        QString str(line);
        desc=desc+str;
        qDebug()<< str;
    }
    QMessageBox message(QMessageBox::Information,"Install details",desc,QMessageBox::Yes|QMessageBox::No,NULL);
    if (message.exec()==QMessageBox::Yes)
    {
        QStringList arg;
        arg << "-e";
        arg << "/bin/bash -x -c \""+QCoreApplication::applicationDirPath()+"/scripts/"+ui->listWidget_script_category->currentItem()->text()+"/"+ui->listWidget_script_root->currentItem()->text()+";echo \"脚本执行完毕，按回车键返回图形界面操作\";read -n 1\"";
        QProcess ::execute("xfce4-terminal",arg);//调用QT里的函数
        qDebug()<<"script/"+ui->listWidget_script_category->currentItem()->text()+ui->listWidget_script_root->currentItem()->text();
    }
    else
    {
        qDebug()<<"clicked no\n";
    }
}

void MainWindow::on_listWidget_script_category_currentTextChanged(const QString &currentText)
{
    qDebug()  << currentText;
    ui->listWidget_script_root->clear();
    QDir dir_script_root("scripts/"+currentText);
    dir_script_root.setFilter(QDir::Files | QDir::Hidden | QDir::NoSymLinks);//列出文件,列出隐藏文件（在Unix下就是以.开始的为文件）,不列出符号链接（不支持符号连接的操作系统会忽略）
    dir_script_root.setSorting(QDir::Size | QDir::Reversed);//按文件大小排序，相反的排序顺序
    const QFileInfoList list_script_root = dir_script_root.entryInfoList();//返回这个目录中所有目录和文件的QFileInfo对象的列表
    QFileInfoList::const_iterator iterator_script_root = list_script_root.begin();
    qDebug() << "目录和文件的数量: " << dir_script_root.count();//返回找到的目录和文件的数量
    qDebug() << "fileName/t/t/tsize/t/t/t";
    while(iterator_script_root != list_script_root.end()){
        ui->listWidget_script_root->addItem((*iterator_script_root).fileName());
        qDebug() << (*iterator_script_root).fileName()<<"/t/t/t"<<(*iterator_script_root).size();
        iterator_script_root++;
    }
    qDebug() << "当前目录: " << dir_script_root.current();//返回应用程序当前目录。
    qDebug() << "当前目录的绝对路径" << dir_script_root.currentPath();//返回应用程序当前目录的绝对路径。
    //    const QList<QString> list = d.entryList(); //返回这个目录中所有目录和文件的名称的列表
    //    QList<QString>::const_iterator iterator = list.begin();
    //    while(iterator != list.end()){
    //        qDebug() << (*iterator);
    //        iterator++;
    //    }
}

void MainWindow::on_pushButton_update_clicked()
{
    QStringList arg;
    arg << "-e";
    arg << "/bin/bash -x -c \""+QCoreApplication::applicationDirPath()+"/update.sh; exec bash\"";
    QProcess ::execute("xfce4-terminal",arg);//调用QT里的函数
    qDebug()<<"script/"+ui->listWidget_script_category->currentItem()->text()+ui->listWidget_script_root->currentItem()->text();
}
