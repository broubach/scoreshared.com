package com.scoreshared.webapp.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.webapp.view.dto.SignupForm;

@Controller
public class IndexController {

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("thisYear", Calendar.getInstance().get(Calendar.YEAR));
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public Map<String, String> signup(HttpServletRequest request, @ModelAttribute SignupForm form) {
        Map<String, String> result = new HashMap<String, String>();

        boolean hasEmptyFields = false;

        if (form.getFirstName() == null || form.getFirstName().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getLastName() == null || form.getLastName().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getEmail() == null || form.getEmail().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getPassword() == null || form.getPassword().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getGender() == null || form.getGender().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getBirthDay() == null || new Integer(0).equals(form.getBirthDay())) {
            hasEmptyFields = true;
        }
        if (form.getBirthMonth() == null || new Integer(-1).equals(form.getBirthMonth())) {
            hasEmptyFields = true;
        }
        if (form.getBirthYear() == null || new Integer(0).equals(form.getBirthYear())) {
            hasEmptyFields = true;
        }

        if (hasEmptyFields) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.please_fill_out_all_fields", null,
                            localeResolver.resolveLocale(request)));

        } else {
            //            if (form.getEmail().indexOf('@') == -1 || form.getEmail().indexOf('.') == -1) {
            //                messages.addErrorMessage(REGISTRAR_NOVO_USUARIO, "error_digite_um_email_valido");
            //            } else if (!PersistenceHelper.findByNamedQuery("emailExistenteQuery", form.getEmail()).isEmpty()) {
            //                messages.addErrorMessage(REGISTRAR_NOVO_USUARIO, "error_email_especificado_jah_existe");
            //            }
            //            validaSenha(REGISTRAR_NOVO_USUARIO, form.getSenha());
        }

        //        if (messages.getErrorMessages().isEmpty()) {
        //            return "passo1";
        //        }

        return result;
    }

}
