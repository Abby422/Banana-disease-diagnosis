
diagnose :-
    diagnose_for(Plant_disease),
    write('The probable disease is '),
    write(Plant_disease),
    nl,
    undo.

diagnose :-
    write('Sorry, I can not be able to diagnose the disease.'),
    nl.

/* diagnoses to be tested */
diagnose_for(panama_wilt):- panama_wilt.
diagnose_for(anthracnose):- anthracnose.
diagnose_for(mycosphaerella_leaf_spot):- mycosphaerella_leaf_spot.
diagnose_for(moko_disease):- moko_disease.
diagnose_for(bacterial_soft_spot):- bacterial_soft_spot.
diagnose_for(curly_top):- curly_top.
diagnose_for(banana_bract_mosaic_virus):- banana_bract_mosaic_virus.
diagnose_for(banana_streak_disease):- banana_streak_disease.
diagnose_for(infectious_chlorosis):- infectious_chlorosis.

/* disease identification rules */
panama_wilt :-
    check_symptom('Yellowing of the lower most leaves from margin to midrib'),
    check_symptom('Yellowing extends upwards and finally the heart leaf alone remains green for some time'),
    check_symptom('Leaves break near the base and hung down around pseudostem'),
    check_symptom('Longitudinal splitting of pseudostem and discolouration of vascular vessels as red or brown streaks'),
    nl.

mycosphaerella_leaf_spot:-
    check_symptom('Small spindle shaped spots on foliage with greyish center and yellowish halo running parallel to veins'),
    check_symptom('If fruit is nearing maturity,individual bananas appear undersized and their flesh develops a buff pinkish colour'),
    nl.


anthracnose :-
    check_symptom('The skin of the fruit turns black and shrivels and finally the whole finger is affected which then affects the whole bunch'),
    check_symptom('Premature ripening and shriveling of the fruits which are covered with pink spore masses'),
    check_symptom('Black lesions on the pedicel causing withering of the pedicel and dropping of the fingers from the hands'),
    check_symptom('The main stalk of the bunch is diseased and Infected fruits are black and rotten'),
    nl.

moko_disease :-
    check_symptom('When cut open, discolouration in vascular region with pale yellow to dark brown colour is seen'),
    check_symptom('Discolouration is in the central portion of the corm'),
    check_symptom('Internal rot of fruits with dark brown discoloration'),
    check_symptom('When the pseudostem is cut traversely bacterial ooze can be seen'),
    nl.

bacterial_soft_spot:-
    check_symptom('•Roting of collar region'),
    check_symptom('Epinasty of leaves, which dry out suddenly'),
    check_symptom('•If affected plants are pulled out it comes out from the collar region leaving the corm with their roots in the soil'),
    check_symptom('Dark brown or yellow water soaked areas are more in the cortex area'),
    check_symptom(' When affected plants are cut open at collar region, yellowish to reddish ooze is seen'),
    nl.

curly_top:-
    check_symptom('Marginal chlorosis and curling of leaves'),
    check_symptom('Petioles fail to elongate'),
    check_symptom('Leaves are reduced in size,chlorotic and stand upright'),
    check_symptom('Leaves are brittle and are crowded at the top'),
    check_symptom('There are shoe dark green streaks with J-hook shape near the midrib'),
    check_symptom('Flowers display moltted and streaked discolouration'),
    check_symptom('Plants show marked stunting'),
    nl.

banana_bract_mosaic_virus:-
    check_symptom('Typical mosaic and spindle shaped mild mosaic streaks on bracts, peduncle and fingers are seen '),
    check_symptom('•Suckers exhibit unusual reddish brown streaks at emergence and separation of leaf sheath from central axis'),
    check_symptom('Clustering of leaves at crown with a travelers palm appearance, elongated peduncle and half filled hands '),
    nl.

banana_streak_disease:-
    check_symptom('Yellow streaking of the leaves, which becomes progressively necrotic producing a black streaked appearance in older leaves'),
    nl.

infectious_chlorosis:-
    check_symptom('Decrease in yield and quality'),
    check_symptom('Light yellow streaks running parallel to leaf veins,usually from mid rib to edge of the blade, giving the leaf a striped appearance'),
    nl.

/*verification */
check_symptom(X) :-
    (yes(X) -> true;
    (no(X) -> fail;
    ask_question(X))).

/* how to ask questions */
ask_question(Symptom) :-
    write('Does your banana have the following symptom : '),
    write(Symptom),
    write('? yes./no. '),
    nl,
    read(Input),
    nl,
    ((Input == yes ; Input ==y) ->
    assert(yes(Symptom));
    assert(no(Symptom)),fail).

/* yes and no will change dynamically according to condition */
:- dynamic yes/1 , no/1 .

/* clearing all memory assigned for the yes or no */
undo :-retract(yes(_)),fail.
undo :-retract(no(_)),fail.
undo.





