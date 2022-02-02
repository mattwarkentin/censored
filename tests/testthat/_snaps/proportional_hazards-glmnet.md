# api errors

    Code
      proportional_hazards() %>% set_engine("lda")
    Error <rlang_error>
      Engine 'lda' is not supported for `proportional_hazards()`. See `show_engines('proportional_hazards')`.

# primary arguments

    Code
      translate(proportional_hazards() %>% set_engine("glmnet"))
    Error <rlang_error>
      For the glmnet engine, `penalty` must be a single number (or a value of `tune()`).
      * There are 0 values for `penalty`.
      * To try multiple values for total regularization, use the tune package.
      * To predict multiple penalties, use `multi_predict()`

# predictions with strata and dot in formula

    Code
      f_fit <- fit(cox_spec, Surv(time, status) ~ . - sex + strata(sex), data = lung2)
    Warning <simpleWarning>
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge

---

    Code
      f_fit_2 <- fit(cox_spec, Surv(time, status) ~ ph.ecog + age + strata(sex),
      data = lung2)
    Warning <simpleWarning>
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge
      cox.fit: algorithm did not converge

---

    Code
      predict(f_fit, lung2, type = "linear_pred")
    Output
      # A tibble: 227 x 1
         .pred_linear_pred
                     <dbl>
       1            -1.09 
       2            -0.579
       3            -0.477
       4            -0.940
       5            -0.511
       6            -1.09 
       7            -1.49 
       8            -1.51 
       9            -0.906
      10            -1.43 
      # ... with 217 more rows
    Code
      predict(f_fit, lung2, type = "survival", time = c(100, 300))
    Warning <simpleWarning>
      'varlist' has changed (from nvar=5) to new 6 after EncodeVars() -- should no longer happen!
      'varlist' has changed (from nvar=5) to new 6 after EncodeVars() -- should no longer happen!
    Output
      # A tibble: 227 x 1
         .pred           
         <list>          
       1 <tibble [2 x 2]>
       2 <tibble [2 x 2]>
       3 <tibble [2 x 2]>
       4 <tibble [2 x 2]>
       5 <tibble [2 x 2]>
       6 <tibble [2 x 2]>
       7 <tibble [2 x 2]>
       8 <tibble [2 x 2]>
       9 <tibble [2 x 2]>
      10 <tibble [2 x 2]>
      # ... with 217 more rows

---

    Code
      f_pred <- predict(f_fit, lung2, type = "survival", time = c(100, 300))
    Warning <simpleWarning>
      'varlist' has changed (from nvar=5) to new 6 after EncodeVars() -- should no longer happen!
      'varlist' has changed (from nvar=5) to new 6 after EncodeVars() -- should no longer happen!
    Code
      f_pred_2 <- predict(f_fit_2, lung2, type = "survival", time = c(100, 300))
