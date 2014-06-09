package com.scoreshared.scaffold;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PaginationHelper {

    public void calculatePaginationWindowAndAddToModel(ModelAndView mav, Integer pageNumber, Integer pageCount) {
        calculatePaginationWindowAndAddToModel(mav.getModelMap(), pageNumber, pageCount);
    }

    public void calculatePaginationWindowAndAddToModel(ModelMap model, Integer pageNumber, Integer pageCount) {
        int windowSize = 5;
        int windowLeft = pageNumber - windowSize/2;
        int windowRight = pageNumber + windowSize/2;

        int spareWeigthLeft = 0;
        if (windowLeft < 0) {
            spareWeigthLeft = Math.abs(windowLeft);
            windowLeft = 0;
        }

        int spareWeigthRight = 0;
        if (windowRight >= pageCount) {
            spareWeigthRight = windowRight - (pageCount-1);
            windowRight = pageCount-1;
        }

        if (pageCount > windowSize) {
            windowLeft -= spareWeigthRight;
            windowRight += spareWeigthLeft;
            if (pageNumber == 0) {
                model.addAttribute("disableFirstArrow", true);
            } else if (pageNumber == (pageCount-1)) {
                model.addAttribute("disableLastArrow", true);
            }
        } else {
            windowLeft = 0;
            windowRight = (pageCount-1);
            model.addAttribute("disableFirstArrow", true);
            model.addAttribute("disableLastArrow", true);
        }
        model.addAttribute("windowLeft", windowLeft);
        model.addAttribute("windowRight", windowRight);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("pageNumber", pageNumber);
    }
}