set @priv = load_file('~/.private_key');
set @pub = load_file('~/.public_key');
select length(@priv), length(@pub);
