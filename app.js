import express from 'express';
import { engine } from 'express-handlebars';
import hbs_sections from "express-handlebars-sections";
const app = express();

app.engine('.hbs', engine({
    extname:'.hbs',
    helpers: {
        section: hbs_sections()
    }
}));
app.set('view engine', 'hbs');
app.set('views', './views');

app.use('/public', express.static('public'));


app.get('/', function (req, res) {
    res.render('auth/login', {
        layout: 'auth'
      });
  });
  
app.get('/auth/signup', (req, res) => {
    res.render('auth/signup', {
      layout: 'auth'
    });
  });

  app.get('/auth/signup', (req, res) => {
    res.render('auth/signup', {
      layout: 'auth'
    });
  });

app.get('/admin/categories/edit', async function (req, res) {
    res.render('admin/manageCategory', {layout: 'user'});
  });
app.get('/admin/info', async function (req, res) {
    res.render('user/info', {layout: 'user'});
  });
app.get('/admin/analysis', async function (req, res) {
    res.render('admin/analysis', {layout: 'user'});
  });

app.get('/admin/manage/categories', async function (req, res) {
    res.render('admin/manageCategory', {layout: 'user'});
});
app.get('/admin/manage/products', async function (req, res) {
  res.render('admin/manageProduct', {layout: 'user'});
});
app.get('/admin/detail/products', async function (req, res) {
  res.render('admin/detailProduct', {layout: 'user'});
});

app.get('/admin/manage/categories/addChildCat', async function (req, res) {
  res.render('admin/ManageCategory/addChildCategory', {layout: 'user'});
});

app.get('/admin/manage/categories/editCat', async function (req, res) {
  res.render('admin/ManageCategory/editCategory', {layout: 'user'});
});


app.get('/admin/manage/users', async function (req, res) {
  res.render('admin/manageUser', {layout: 'user'});
});

app.get('/admin/manage/users/detail', async function (req, res) {
  res.render('admin/userDetail', {layout: 'user'});
});



app.set('port',process.env.PORT || 5000);
app.listen(app.get('port'), function () {
  console.log(`Example app listening at http://localhost:${app.get('port')}`);
});