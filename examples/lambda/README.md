Exmaple LAMDA
================

#### How to run

tune `fir` design with online training 
``` shell
uptune lambda.py fir \
       -lm xgbregressor -td data/fir_LUT.csv -pf 2
```

tune `dscg` design (template mode) with only offline training 
``` shell
uptune lambda_tpl.py dscg \
       -lm xgbregressor -td data/dscg_LUT.csv -pf 2 -offline
```

#### File Structures 

``` shell
    auto.sh
    lambda.py            # intrusive tuning example      
    lambda_tpl.py        # template tuning example
    synthesis.py         # func calls to inquiry database
    data/                # validation and feature database
        aes_LUT.csv
        bfly_LUT.csv
        dscg_LUT.csv
        fir_LUT.csv
        mm3_LUT.csv
        ode_LUT.csv
        syn2_LUT.csv
```
