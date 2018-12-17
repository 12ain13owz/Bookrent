const compression = require('compression')
const express = require('express')
const router = express.Router()

const favicon = require('serve-favicon')
const icurl = './public/images/book.ico'

const session = require('express-session')
const filestore = require('session-file-store')(session)
const options = {
    name: 'connect.sid',
    store: new filestore(),
    secret: 'wrq4qiinqbtkoteiqdi6gmrsko8i',
    resave: true,
    saveUninitialized: true,
    cookie: { maxAge: 1000 * 60 * 60 * 24 * 90, secure: false, httpOnly: true }
};

const fileupload = require('express-fileupload')
const trim = require('trim-request')
const ctrl = require('../models/func')

router.use(compression())
router.use(session(options))
router.use(favicon(icurl))
router.use(fileupload())
router.use(trim.all)

/* GET home page. */
router.get('/', ctrl.login, (req, res, next) => {
    res.render('login', { title: 'Bookrent' })
})

router.post('/', ctrl.auth, (req, res, next) => {
    res.send(req.stat, { msg: req.msg })
})

router.get('/index', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data, }
    ctrl.index((err, data) => {
        res.render('index', { layout, data })
    })
})

router.get('/register', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    res.render('register', { layout })
})

router.post('/register', ctrl.conn, (req, res, next) => {
    ctrl.regis(req.body, (err, msg) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: msg, idcard: req.body.idcard })
    })
})

router.get('/editregis', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    ctrl.listcus((err, data) => {
        res.render('editregis', { layout, data: JSON.stringify(data) })
    })
})

router.post('/editregis', ctrl.conn, (req, res, next) => {
    ctrl.editcus(req.body, (err, msg) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: msg })
    })
})

router.post('/searchcustomer', ctrl.conn, (req, res, next) => {
    ctrl.searchcus(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else {
            ctrl.listrentbook(data.id, (err, listrent) => {
                res.send({ msg: 'success', data, listrent })
            })
        }
    })
})

router.get('/borrow', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    ctrl.listcus((err, data) => {
        res.render('borrow', { layout, data: JSON.stringify(data) })
    })
})

router.get('/category', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    ctrl.cate(req.query, (err, data) => {
        res.render('category', { layout, data })
    })
})

router.get('/report', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }

    ctrl.report(req.query.month, (err, data) => {
        res.render('report', { layout, data })
    })
})

router.post('/report', ctrl.conn, (req, res, next) => {
    ctrl.excel(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: data })
    })
})

router.get('/addbook', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    res.render('addbook', { layout })
})

router.post('/addbook', ctrl.conn, (req, res, next) => {
    ctrl.addimg(req.body, req.files, (err, pathimg) => {
        ctrl.addbook(req.body, pathimg, (err, data) => {
            if (err) res.status(400).send({ msg: err })
            else res.send({ msg: 'success', data })
        })
    })
})

router.post('/listbook', ctrl.conn, (req, res, next) => {
    ctrl.listbook(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else {
            ctrl.listpublisher(req.body.publisher)
            res.send({ msg: data })
        }
    })
})

router.get('/searchbook', ctrl.conn, (req, res, next) => {
    ctrl.searchbook(req.query.searchbook, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: 'success', data })
    })
})

router.get('/searchallbook', ctrl.conn, (req, res, next) => {
    ctrl.searchallbook(req.query.searchbook, (err, data, allbook) => {
        if (err) res.status(400).send({ msg: err })
        else {
            ctrl.listrentbook(req.query.id, (err, resrent) => {
                res.send({ msg: 'success', data, allbook, resrent })
            })
        }
    })
})

router.post('/rentbook', ctrl.conn, (req, res, next) => {
    ctrl.rentbook(req.body, (err, data, id) => {
        if (err) res.status(400).send({ msg: err })
        else {
            ctrl.listrentbook(id, (err, listrent) => {
                res.send({ msg: data, listrent })
            })
        }
    })
})

router.post('/rebook', ctrl.conn, (req, res, next) => {
    ctrl.rebook(req.body, (err, data) => {
        res.send({ msg: data })
    })
})

router.get('/editbook', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    res.render('editbook', { layout })
})

router.post('/editlistbook', ctrl.conn, (req, res, next) => {
    ctrl.editlistbook(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else {
            ctrl.genlistbook((err, rows) => {
                res.send({ msg: data })
            })
        }
    })
})

router.get('/editvolbook', ctrl.conn, (req, res, next) => {
    ctrl.searchvolbook(req.query, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else res.send(data)
    })
})

router.post('/editvolbook', ctrl.conn, (req, res, next) => {
    ctrl.addimg(req.body, req.files, (err, pathimg) => {
        ctrl.editvollbook(req.body, pathimg, (err, data) => {
            if (err) res.status(400).send({ msg: err })
            else res.send({ msg: 'success', data })
        })
    })
})

router.get('/setting', ctrl.conn, (req, res, next) => {
    let layout = { title: 'Bookrent', sess: req.session.user_data }
    res.render('setting', { layout, })
})

router.post('/regisacc', ctrl.conn, (req, res, next) => {
    ctrl.regisacc(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: data })
    })
})

router.post('/changepass', ctrl.conn, (req, res, next) => {
    ctrl.changepass(req.body, (err, data) => {
        if (err) res.status(400).send({ msg: err })
        else res.send({ msg: data })
    })
})

router.get('/logout', ctrl.conn, (req, res, next) => {
    req.session.destroy()
    res.redirect('/')
})

module.exports = router