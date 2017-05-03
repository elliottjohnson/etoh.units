;;;; oeno.units.lisp

(in-package #:oeno.units)

(defmacro define-unit-list (&rest unit-list)
  `(progn ,@(loop for (unit-name unit-definition) in unit-list
	       collect `(define-units ,unit-name
			    ,unit-definition))))

(define-unit-list

  ;; Compound units:
        
  ;; Weight or mass per mole is a common compound unit.
  ((kg/mol molecular-mass molecular-weight atomic-mass atomic-weight)
   (/ kg mol))		           ; SI units here, but commonly g/mol
  ((g/mol) (/ grams mol))	   ; For convinence"
  ((mol/g) (/ 1 g/mol))

  ;; Base volumes
  ((square-meter square-meters m^2) (* m m))
  ((square-inch square-inches in^2) (* in in))
  ((square-foot square-feet ft^2) (* ft ft))
  ((cubic-meter cubic-meters m^3) (* m^2 m))
  ((cubic-inch cubic-inches in^3) (* in^2 in))
  ((cubic-foot cubic-feet ft^3) (* ft^2 ft))
  
  ;; Volume per mole is another common compound unit in chemistry
  ((m^3/mol Vm l/mol v/mol molar-volume) (/ liter mol))
  ((dm^3/mol) (* m^3/mol deci))	       ; Common for gasses
  ((cm^3/mol) (* m^3/mol centi))       ; Common for liquids or solids.

  ;; Density is often used
  ((kg/m^3 kg/l weight-per-volume w/vol) (/ kg m^3))
  ((g/L grams-per-liter) (/ grams liter))    ; ppt
  ((mg/L milligrams-per-liter) (/ mg liter)) ; ppm
  ((g/ml grams-per-milliliter) (/ grams ml))
  
  ;; Inverse mol, common for unit conversion
  ((1/mole 1/mol) (/ 1 mol))

  ;; Dimensionless units

  ;; Proof is commonly used, especially with spirits.
  ((proof pf degrees-proof proof-us pf-us) (* 2 percent))
  ((english-proof proof-uk pf-uk) (* 7/4)) ; get out the gunpowder.

  ;; parts notation is often used.
  ((parts-per-thousand ‰ pp-thousand) 0.001)
  ((parts-per-million ppm) 0.000001)
  ((parts-per-billion ppb) 0.00000001)
  ((parts-per-trillion ppt) 0.000000001)

  ;; Practical and impractical units (... & how they live on).
  ;;   Bottles, cases
  ((bottle bottles) (* 750 ml))
  ((split splits demi demis) (/ 2 bottle))
  ((magnum magnums) (* 2 bottles))
  ((jeroboam jeroboams) (* 4 bottles))
  ((rehoboam rehoboams) (* 6 bottles))
  ((methusaleh methusalehs) (* 8 bottles))
  ((salmanazar salmanazars) (* 12 bottles))
  ((balthazar balthazars) (* 16 bottles))
  ((nebuchadnezzar nebuchadnezzars melchior melchiors) (* 20 bottles))
  ((solomon solomons) (* 24 bottles))
  ((sovereign sovereigns) (* 35 bottles))
  ((primat primats) (* 36 bottles))
  ((melchizedek mechizedeks) (* 40 bottles))
  ((tonneau-wine) (* 1200 bottles))
  ;;   Packaging volumes for bottles (750ml only)
  ((cases case) (* 12 bottles))
  ((pallet pallets) (* 56 cases))

  ;; Vineyard to winery units. TODO add more here.
  ((tons/acre-us  ))
  ((tons/acre-metric))
  
  ;;   English sizes, defining first since imperial-gallons
  ;;      appear in a lot of other regional volumes
  ((gallon-imperial gallons-imperial
		    gallon-uk gal-uk
		    gallons-uk gals-uk
		    gal-imp gals-imp
		    imperial-gallon
		    imperial-gallons
		    imp-gal imp-gals)
   (* liters 4.546))
  ((gallon-uk-wine gallons-uk-wine gal-uk-wine gals-uk-wine) gallon)
  ((tun-uk tuns-uk) (* 210 imp-gals))
  ((tun-uk-old) (* 256 gals-uk-wine))
  ((pipe-uk pipes-uk butt-uk butts-uk) (/ tun-uk 2))
  ((hogshead-uk-wine) (/ tun-uk 4))
  ((puncheon-uk tertian-uk firkin-uk-wine) (/ tun-uk 3))
  ((tierce-uk) (/ tun-uk 6))
  ((barrel-uk-wine bbl-uk-wine) (/ tun-uk 8))
  ((rundlet-uk) (/ tun-uk 14))
  ((butt-uk-whisky butts-uk-whisky) (* 108 gals-imp))
  ((bucket-uk buckets-uk) (* 4 gals-imp))
  ((pint-uk pints-uk imp-pint imp-pints imperial-pint)
   (/ gal-uk 8))
  ((fluid-ounce-uk floz-uk ozfl-uk imperial-fluid-ounce imp-floz)
   (/ gal-uk 160))
  ((fluid-drachm-imperial imperial-fluid-drachm) (/ imp-floz 2))
  ((fluid-dram-uk fluid-drams-uk fldr-uk fluidram imperial-fluid-dram imp-fldr)
   (/ imp-floz 8))
  ((scruple-uk scruple fl-s) (/ fluid-dram-uk 3))
  ((tablespoon-uk tbsp-uk tblsp-uk) (* 5/8 imp-floz))
  ((teaspoon-uk tsp-uk) (/ tbsp-uk 3))
  ((smidgen-uk) (/ teaspoon-uk 32))
  ((cup-canadian cup-ca) (* 8 imp-floz))
  ((cup-uk-breakfast tumblerful-uk tumblerful) (* 10 imp-floz))
  ((dash-uk dashes-uk ds-uk) (/ tbsp-uk 8))
  ((pinch-uk pinches-uk) (/ dash-uk 2))
  ((dessertspoon-uk dsp-uk dssp-uk) (* 2 tsp-uk))
  ((drop-uk drops-uk) (/ imp-floz 288))
  ((gill-uk) (* 5 imp-floz))
  ((teacup-uk imperial-teacup) gill-uk)
  ((drop-uk-alternate) (/ gill-uk 1824))
  ((gallon-scotish gal-scotish gallons-scot) (* 3 gal-imp))
  ((pint-scottish pints-scottish joug) (* 3 imp-pints))
  ((minim-uk minims-uk) (/ imp-floz 480))
  ((peck-uk pecks-uk) (* 554.84 in^3))
  ((pint-uk-reputed whiskey-pint) (/ gal-imp 12))
  ((quart-uk-reputed whiskey-quart) (* 80/3 imp-floz))
  ((quart-scottish quarts-scottish) (* 2 pints-scottish))
  ((quart-uk quarts-uk quart-imperial quarts-imp)
   (/ gal-imp 4))
  ((quart-uk-winchester quart-winchester) (* 2.5 liters))
  ;;   UK brewing sizes
  ((barrel-uk-ale bbl-uk-ale barrel-uk-beer bbl-uk-beer) (* 36 gal-imp))
  ((gallon-uk-ale gal-uk-ale gal-uk-beer) (* 4.621 liters))
  ((firkin-uk-ale firkin-uk-beer) (/ bbl-uk-beer 4))
  ((pin-uk pin) (/ bbl-uk-beer 8))
  ((minipin-uk minipin) (* 2.25 gal-imp))
  ((kilderkin-uk) (* 18 gal-imp))
  ((hogshead-uk-ale) (* 54 gal-imp))
  ((water-ton-uk water-ton) (* 224 imp-gals))
  ((wineglassful-uk) (* 2.5 imp-floz))

  ;;   Australian Volumes
  ((butcher-au butcher) (* 7 imp-floz)) ; a glass of beer
  
  ;;   Chinese Volumes
  ((sheng-cn sheng) liter)
  ((cuo-cn cuo) ml)
  ((dan-cn dan) (* 100 sheng))
  ((dou-cn dou) (* 10 sheng))
  ((ge-cn ge) (/ sheng 10))
  ((hop-cn hop-hk) (* 0.1 liters))
  ((seh-cn seh-hk seh) (* 100 liters))
  ((shao-cn shao) (/ sheng-cn 100))
  
  ;;   European Volumes
  ((barrel-eu-beer bbl-eu-beer keg-eu-beer) (* 50 liters))
  ((barrel-eu-beer-half
    bbl-eu-beer-1/2
    half-barrel-eu-beer
    half-barrels-eu-beer) (* 25 liters))
  ((foudre-be foudre) (* 30 hectoliter))
  ((immi-ch immi) (* 1.5 liters))
  ((mal-no mål) (* 10 liters))
  ((pot-be) (* 0.5 liters))
  ((pot-dk) (* 0.967 liters))
  ((pot-no) (* 0.965 liters))
  ((pot-ch) (* 1.5 liters))
  ((tonde-dk tonde) (* 144 pot-dk))
  
  ;;   French Volumes
  ((barrel-fr-bordeaux bbl-bordeaux barrique) (* 225 liters))
  ((barrel-fr-burgundy bbl-burgundy) (* 228 liters))
  ((barrel-fr-cognac bbl-cognac barrique-cognac) (* 300 liters))
  ((chopine-canadian chopine-ca) imp-pint)
  ((chopine-fr) (/ pinte-fr 2))
  ((demi-fr-beer) (* 250 ml))
  ((demiard-fr demiard) (/ pinte-fr 4))
  ((demipinte-fr demipinte) (/ pinte-fr 2))
  ((feuillette-fr feuillette) (* 144 pinte-fr))
  ((french-cubic-foot cubic-foot-fr cubic-feet-fr)
   (/ meter 3))
  ((galopin-fr galopin) (* 200 ml))
  ((muid-fr muid) (* 8 cubic-feet-fr))
  ((pinte-fr pinte) (* 952.146 ml))	; ~2 UK pints
  ((pied-cube-fr pied-cube) (* 36 pinte-fr))
  ((pipa-fr-anjou pipa-anjou) (* 405.21 liters))
  ((posson-fr posson) (/ pinte-fr 8))
  ((pottle-fr pottle) (/ gal-imp 2))
  ((pouce-cube-fr pouce-cube) (/ pinte-fr 48))
  ((quade-fr quade) (* 2 pinte-fr))
  ((quart-fr-champagne) (* 26 fluid-ounces))
  ((quart-de-litre 1/4-litre 1/4-liter) (/ liter 4))
  ((quartaut-fr quartaut) (* 72 pinte-fr))
  ((roquille-fr roquille) (/ pinte 32))
  ((tonneau-fr tonneau) (* 42 pied-cube-fr))
  ((velte-fr velte) (* 8 pinte-fr))
  
  ;;   German Volumes
  ((fuder-de-metric fuder-metric fuden-de-metric fuden-metric)
   cubic-meter)
  ((fuder-de-traditional) (* 900 liters))
  ((fuder-at fuder-austrian) (* 1.811 cubic-meters))
  ((ohm-de aume-de aume) (/ fuder-de-metric 6))
  
  ;;   Italian Volumes
  ((amphora amphorae) (* 27.18 liters))
  ((amphora-Italikos) (* 18.5 liters))
  ((amphora-Ptolemy) (* 36 liters))
  ((gallon-roman galeta) (* 216 in^3))
  ((quarto-it) (* 73.6 liters))
  
  ;;   Japanese Volumes
  ((sho-jp sho) (* 1.804 liters))
  ((go-jp go) (/ sho-jp 10))
  ((koku-jp koku) (* 100 sho-jp)) ;; ~Vol rice/person/year in tradional Japan.
  ((sai-jp sai) (/ sho-jp 1000))
  ((shaku-jp shaku) (/ sho-jp 100))
  ((to-jp to) (* 10 sho-jp))
  
  ;;   Korean Volumes
  ((mal-kr-big mal-big) (* 18.039 liters))
  ((mal-kr-small mal-small) (* 9.0195 liters))
  ((hop-kr hop) (/ mal-kr-big 100))
  ((doe-kr doe) (* 10 hop-kr))
  ((seok-kr seok sok-kr sok seom-kr seom som-kr som) (* 10 mal-kr-big))
  
  ;;   Metric Volumes
  ((cup-metric cup-au) (* 250 ml))
  ((hectoliter hl) (* 100 liters))
  ((pint-metric pints-metric) (* 500 ml))
  ((pinte-fr-canadian pinte-fr-ca) pint-metric)
  ((teaspoon-metric-kitchen kitchen-teaspoon kitchen-tsp)
   (* 5 ml))
  ((dessertspoon-metric-cooking dsp-cooking dssp-cooking)
   (* 2 kitchen-tsp))
  ((drop-metric-medical drop-medical) (/ ml 12))
  ((drop-metric) (* 50 liters micro))
  ((polypin-metric) (* 20 liters))
  ((minipin-metric) (/ polypin-metric 2))
  ((fluid-ounce-us-food floz-us-food us-food-labeling-fluid-ounce)
   (* 30 ml))

  ;;   Spanish Volumes
  ((fanega-es fanega) (* 55.5 liters))
  ((almude-es) (/ fanega-es 12))
  ((azumbre-es azumbre) (* 2.0166 liters))
  ((cuartillo-es cuartillo) (/ azumbre 4))
  
  ;;   Portugese Volumes
  ((almude-pt) (* 16.7 liters))
  ((fanga-pt fanga) (* 55.364 liter))
  ((pipe-pt port-pipe pipe-port pipa) (* 500 liters))
  ((oitavo-pt oitavo) (/ fanga-pt 32))
  ((quarto-pt) (* 2 oitavo-pt))

  ;;   Russian Volumes
  ((vedro-rs vedro) (* 12.29941 liters))
  ((bochka-rs bochka) (* 40 vedro-rs))
  ((butylka-rs-vinnaya) (/ vedro-rs 16))
  ((butylka-rs-vodochnaya) (/ vedro-rs 20))
  ((charka-rs charka) (/ vedro-rs 100))
  ((chetvert-rs chetvert) (/ vedro-rs 8))
  ((kosushka-rs kosushka shkalik-rs shkalik) (/ vedro-rs 200))
  ((kruzhka-rs kruzhka) (/ vedro-rs 10))
  
  ;;   US Volumes
  ((bucket-us) (* 5 gallons))
  ((barrel-us-beer bbl-us-beer barrels-us-beer bbls-us-beer) (* 31 gallons))
  ((barrel-us-whiskey bbl-us-whiskey american-standard-barrel bbl-asb)
   (* 53 gallons))
  ((barrel-us-whiskey-quarter
    bbl-us-whiskey-1/4
    quarter-whiskey-cask
    quarter-whiskey-casks)
   (* 13 gallons))
  ((barrel-us-beer-quarter
    bbl-us-beer-1/4
    pony-keg
    pony-kegs
    quarter-beer-barrel
    quarter-beer-barrels)
   (/ bbl-us-beer 4))
  ((barrel-us-beer-sixth bbl-us-beer-1/6 torpedo-keg torpedo-kegs)
   (/ bbl-us-beer 6)) ;; ~56 x 12 floz
  ((butt-us) (* 126 gallons))
  ((cup-coffee) (* 150 ml))
  ((cup-us) cup)
  ((puncheon-us-beer) (* 72 gallons))
  ((puncheon-us-wine) (* 84 gallons))
  ((dash-us dashes-us ds-us) (/ teaspoon 8))
  ((pinch-us pinches-us) (/ dash-us 2))
  ((dessertspoon-us dsp-us dssp-us) (* 2 teaspoons))
  ((drop-us drops-us drop drops) (/ teaspoon 60))
  ((drop-us-cooking drops-us-cooking drop-cooking drops-cooking)
   (/ teaspoon 96))
  ((drop-us-alternate) (/ teaspoon 76))
  ((fluid-dram-us fldr-us) (/ fluid-ounce 8))
  ((gallon-us-fifth gal-us-fifth gal-us-1/5 fifth) (/ gallon 5))
  ((gill-us) (* 4 fluid-ounces))
  ((gorda-us) (* 185 gallons))
  ((jigger) (* 1.5 fluid-ounces))
  ((keg-us kegs-us keg kegs half-barrel 1/2-bbl) (* 15.5 gallons))
  ((minikeg-us minikegs-us minikeg minikegs) (* 5 liters))
  ((minim-us minims-us) (/ fluid-ounce 480))
  ((peck-us pecks-us) (* 537.605 in^3))
  ((pint-us pints-us pint-us-liquid) (/ gallon 8))
  ((pony-shot) (* 0.75 fluid-ounce))
  ((shot-us shot) fluid-ounce)
  ((smidgen-us smidgen) (/ teaspoon 32))
  ((tumbler-us tumbler) cup)
  ((wineglass-us wineglass) gill-us))
