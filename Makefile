upload: uploaded

index.html: index.first.html first-stab-th.body.html index.last.html
	cat $^ > $@

first-stab-th.html first-stab-th.body.html: first-stab-th.txt
	carbonsuit -x $<

uploaded-root: index.html my.css my-ga.js
	scp $? websv:/www/
	touch uploaded-root

uploaded-entry: first-stab-th.html
	scp $? websv:/www/entry/
	touch uploaded-entry

uploaded: uploaded-root uploaded-entry
	touch uploaded

