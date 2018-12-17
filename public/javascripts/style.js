const validation = function() {}

validation.prototype.text = function(err, id) {
    this.obj = $('#' + id)
    if (this.obj.val().trim() == '') {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else this.obj.closest('div').removeClass('has-error')
    return err
}

validation.prototype.email = function(err, id) {
    this.obj = $('#' + id)
    let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

    if (this.obj.val().trim() == '') {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else if (!emailReg.test(this.obj.val())) {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else this.obj.closest('div').removeClass('has-error')
    return err
}

validation.prototype.idcard = function(err, id) {
    this.obj = $('#' + id)
    let idc = this.obj.val()

    if (idc.length != 13) {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else {
        let sum = 0
        for (let i = 0; i < 12; i++) {
            sum += parseFloat(idc.charAt(i)) * (13 - i)
        }
        if ((11 - sum % 11) % 10 != parseFloat(idc.charAt(12))) {
            this.obj.closest('div').addClass('has-error')
            err = true
        } else {
            this.obj.closest('div').removeClass('has-error')
        }
    }
    return err
}

validation.prototype.mobiletel = function(err, id) {
    this.obj = $('#' + id)
    if (this.obj.val().length != 10) {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else this.obj.closest('div').removeClass('has-error')
    return err
}

validation.prototype.age = function(err, id) {
    this.obj = $('#' + id)
    if (this.obj.val() <= 0 || this.obj.val() > 120) {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else this.obj.closest('div').removeClass('has-error')
    return err
}

validation.prototype.zipcode = function(err, id) {
    this.obj = $('#' + id)
    if (this.obj.val().length != 5) {
        this.obj.closest('div').addClass('has-error')
        err = true
    } else this.obj.closest('div').removeClass('has-error')
    return err
}

const btnprocess = function(id) {
    this.obj = $('#' + id)
    this.text = this.obj.find('span').text()
}

btnprocess.prototype.loading = function(val) {
    this.obj.prop('disabled', true)
    if (val != '' || val != undefined) this.obj.find('span').text(val)
    this.obj.prepend('<i class="ic fas fa-spinner fa-spin"></i>')
}

btnprocess.prototype.reset = function() {
    this.obj.prop('disabled', false)
    this.obj.find('span').text(this.text)
    this.obj.find('i').remove()
}

const AZOnly = (e) => { e.value = e.value.replace(/[^A-z0-9]/g, '') }
const NumberOnly = (e) => { e.value = e.value.replace(/[^0-9]/g, '') }
const Decimal = (e) => { e.value = e.value.replace(/[^0-9\.]/g, '') }

const FocusError = () => {
    let $this = $('form').find('.has-error').find('input')[0].id
    $('#' + $this).focus()
}

const Calcage = (birthday) => {
    let ageDifMs = Date.now() - birthday.getTime()
    let ageDate = new Date(ageDifMs)
    return Math.abs(ageDate.getUTCFullYear() - 1970)
}

const getUrlParameter = (sParam, href) => {
    let sPageURL = href.substring(href.indexOf('#') + 1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1]
        }
    }
}

const UrlParameter = (sParam) => {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=')

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1]
        }
    }
}