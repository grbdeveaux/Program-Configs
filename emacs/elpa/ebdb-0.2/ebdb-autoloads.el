;;; ebdb-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ebdb" "ebdb.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb.el

(defsubst ebdb-records (&optional record-class child-p) "\
Return a list of all EBDB records; load databases if necessary.
This function also notices if databases are out of sync.

If RECORD-CLASS is given, only return records of this class or,
if CHILD-P is non-nil, one of its subclasses." (unless ebdb-db-list (ebdb-load)) (if record-class (seq-filter (lambda (r) (if child-p (object-of-class-p r record-class) (same-class-p r record-class))) ebdb-record-tracker) ebdb-record-tracker))

(autoload 'ebdb-load "ebdb" "\
Load all databases listed in `ebdb-sources'.  All the
important work is done by the `ebdb-db-load' method.

\(fn)" nil nil)

(autoload 'ebdb-version "ebdb" "\
Return string describing the version of EBDB.
With prefix ARG, insert string at point.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "ebdb-com" "ebdb-com.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-com.el

(autoload 'ebdb-search-invert "ebdb-com" "\
Toggle inversion of the next search command.
With prefix ARG a positive number, invert next search.
With prefix ARG a negative number, do not invert next search.

\(fn &optional ARG)" t nil)

(autoload 'ebdb-do-records "ebdb-com" "\
Return list of records to operate on.
Normally this list includes only the current record, but if any
records in the current buffer are marked, they are returned
instead.  If FULL is non-nil, the list of records includes
display information.

\(fn &optional FULL)" nil nil)

(autoload 'ebdb-mode "ebdb-com" "\
Major mode for viewing and editing the Insidious Big Brother Database.

Derives from `special-mode'; the usual `special-mode' bindings apply.

\\{ebdb-mode-map}

\(fn)" t nil)

(autoload 'ebdb-clone-buffer "ebdb-com" "\
Make a copy of the current *EBDB* buffer, renaming it.

\(fn)" t nil)

(autoload 'ebdb-rename-buffer "ebdb-com" "\
Rename current *EBDB* buffer.

\(fn NEW-NAME)" t nil)

(autoload 'ebdb-timestamp-older "ebdb-com" "\
Display records with timestamp older than DATE.
DATE must be in yyyy-mm-dd format.

\(fn DATE &optional FMT)" t nil)

(autoload 'ebdb-timestamp-newer "ebdb-com" "\
Display records with timestamp newer than DATE.
DATE must be in yyyy-mm-dd format.

\(fn DATE &optional FMT)" t nil)

(autoload 'ebdb-creation-older "ebdb-com" "\
Display records with creation-date older than DATE.
DATE must be in yyyy-mm-dd format.

\(fn DATE &optional FMT)" t nil)

(autoload 'ebdb-creation-newer "ebdb-com" "\
Display records with creation-date newer than DATE.
DATE must be in yyyy-mm-dd format.

\(fn DATE &optional FMT)" t nil)

(autoload 'ebdb-creation-no-change "ebdb-com" "\
Display records that have the same timestamp and creation-date.

\(fn &optional FMT)" t nil)

(autoload 'ebdb-create-record "ebdb-com" "\
Create a new EBDB record.

Assume that we're creating a record in the first database found
in `ebdb-db-list', using its default record class.  Use
`ebdb-create-record-extended' to be prompted for these values.

\(fn DB &optional RECORD-CLASS)" t nil)

(autoload 'ebdb-create-record-extended "ebdb-com" "\


\(fn)" t nil)

(autoload 'ebdb-insert-field "ebdb-com" "\


\(fn RECORDS)" t nil)

(autoload 'ebdb-edit-field "ebdb-com" "\
Edit the field under point.  If point is on the name header of
the record, change the name of the record.

\(fn RECORD FIELD)" t nil)

(autoload 'ebdb-edit-field-customize "ebdb-com" "\


\(fn RECORD FIELD)" t nil)

(autoload 'ebdb-edit-foo "ebdb-com" "\
For RECORD edit some FIELD (mostly interactively).

Interactively, if called without a prefix, edit the notes field
of RECORD.  When called with a prefix, prompt the user for a
field to edit.

\(fn RECORD FIELD)" t nil)

(autoload 'ebdb-delete-field-or-record "ebdb-com" "\
For RECORDS delete FIELD.

If point is on the record header (within the name), delete
RECORDS from the database.  If prefix NOPROMPT is non-nil, do not
confirm deletion.

\(fn RECORDS FIELD &optional NOPROMPT)" t nil)

(autoload 'ebdb-delete-records "ebdb-com" "\
Delete RECORDS.
If prefix NOPROMPT is non-nil, do not confirm deletion.

\(fn RECORDS &optional NOPROMPT)" t nil)

(autoload 'ebdb-move-records "ebdb-com" "\


\(fn RECORDS DB)" t nil)

(autoload 'ebdb-copy-records "ebdb-com" "\


\(fn RECORDS DB)" t nil)

(autoload 'ebdb-display-all-records "ebdb-com" "\
Show all records.
If invoked in a *EBDB* buffer point stays on the currently visible record.
Inverse of `ebdb-display-current-record'.

\(fn &optional FMT)" t nil)

(autoload 'ebdb-display-current-record "ebdb-com" "\
Narrow to current record.  Inverse of `ebdb-display-all-records'.

\(fn &optional FMT)" t nil)

(autoload 'ebdb-toggle-records-format "ebdb-com" "\
Toggle fmt of RECORDS (elided or expanded).
With prefix ARG 0, RECORDS are displayed elided.
With any other non-nil ARG, RECORDS are displayed expanded.

\(fn RECORDS &optional ARG)" t nil)

(autoload 'ebdb-display-records-completely "ebdb-com" "\
Display RECORDS using layout `full-multi-line' (i.e., display all fields).

\(fn RECORDS)" t nil)

(autoload 'ebdb-display-records-with-fmt "ebdb-com" "\
Display RECORDS using FMT.

\(fn RECORDS FMT)" t nil)

(autoload 'ebdb-omit-records "ebdb-com" "\
Remove current record from the display without deleting it from EBDB.
With prefix N, omit the next N records.  If negative, omit backwards.

\(fn RECORDS)" t nil)

(autoload 'ebdb "ebdb-com" "\
Display all records in the EBDB matching REGEXP
in any field.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-name "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the name
\(or ``alternate'' names).

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-organization "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the organization field.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-address "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the address fields.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-mail "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the mail address.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-phone "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the phones field.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-notes "ebdb-com" "\
Display all records in the EBDB matching REGEXP in the phones field.

\(fn STYLE REGEXP &optional FMT)" t nil)

(autoload 'ebdb-search-user-fields "ebdb-com" "\
Display all EBDB records for which user field FIELD matches CRITERION.

\(fn STYLE FIELD CRITERION &optional FMT)" t nil)

(autoload 'ebdb-search-modified "ebdb-com" "\
Display records with unsaved modifications.

\(fn STYLE &optional FMT)" t nil)

(autoload 'ebdb-search-duplicates "ebdb-com" "\
Search all records that have duplicate entries for FIELDS.
The list FIELDS may contain the symbols `name', `mail', and `aka'.
If FIELDS is nil use all these fields.  With prefix, query for FIELDS.
The search results are displayed in the EBDB buffer.

\(fn &optional FIELDS FMT)" t nil)

(autoload 'ebdb-search-database "ebdb-com" "\
Select a database and show all records from that database.

\(fn STYLE DB &optional FMT)" t nil)

(autoload 'ebdb-search-record-class "ebdb-com" "\
Prompt for a record class and display all records of that class.

\(fn STYLE CLASS &optional FMT)" t nil)

(autoload 'ebdb-search-single-record "ebdb-com" "\
Prompt for a single record, and display it.

\(fn RECORD &optional FMT)" t nil)

(autoload 'ebdb-mail "ebdb-com" "\
Compose a mail message to RECORDS (optional: using SUBJECT).

If ARG (interactively, the prefix arg) is nil, use the first mail
address of each record.  If it is t, prompt the user for which
address to use.

Another approach is to put point on a mail field and press \"a\",
for `ebdb-field-action'.

\(fn RECORDS &optional SUBJECT ARG)" t nil)

(autoload 'ebdb-completion-predicate "ebdb-com" "\
For use as the third argument to `completing-read'.
Obey `ebdb-completion-list'.

\(fn KEY RECORDS)" nil nil)

(autoload 'ebdb-completing-read-mails "ebdb-com" "\
Like `read-string', but allows `ebdb-complete-mail' style completion.

\(fn PROMPT &optional INIT)" nil nil)

(autoload 'ebdb-complete-mail "ebdb-com" "\
In a mail buffer, complete the user name or mail before point.
Completion happens up to the preceeding colon, comma, or BEG.
Return non-nil if there is a valid completion, else return nil.

Completion behaviour obeys `ebdb-completion-list' (see there).
If what has been typed matches a unique EBDB record, insert an address
formatted by `ebdb-dwim-mail' (see there).  Also, display this record
if `ebdb-completion-display-record' is non-nil,
If what has been typed is a valid completion but does not match
a unique record, display a list of completions.
If the completion is done and `ebdb-complete-mail-allow-cycling' is t
then cycle through the mails for the matching record.  If EBDB
would format a given address different from what we have in the mail buffer,
the first round of cycling reformats the address accordingly, then we cycle
through the mails for the matching record.
With prefix CYCLE-COMPLETION-BUFFER non-nil, display a list of all mails
available for cycling.

Set the variable `ebdb-complete-mail' non-nil for enabling this feature
as part of the MUA insinuation.

\(fn &optional BEG CYCLE-COMPLETION-BUFFER)" t nil)

(autoload 'ebdb-mail-aliases "ebdb-com" "\
Add aliases from the database to the global alias table.

Give records a \"mail alias\" field to define an alias for that
record.

If multiple records in the database have the same mail alias,
then that alias expands to a comma-separated list of the mail addresses
of all of these people.

\(fn &optional NOISY)" t nil)

(autoload 'ebdb-grab-url "ebdb-com" "\
Grab URL and store it in RECORD.

\(fn RECORD URL LABEL)" t nil)

(autoload 'ebdb-copy-records-as-kill "ebdb-com" "\
Copy RECORDS to kill ring.

\(fn RECORDS)" t nil)

(autoload 'ebdb-copy-fields-as-kill "ebdb-com" "\
For RECORDS copy values of FIELD at point to kill ring.
If FIELD is an address or phone with a label, copy only field values
with the same label.  With numeric prefix NUM, if the value of FIELD
is a list, copy only the NUMth list element.

\(fn RECORDS FIELD &optional NUM)" t nil)

(autoload 'ebdb-copy-mail-as-kill "ebdb-com" "\
Copy dwim-style mail addresses for RECORDS.

Ie, looks like \"John Doe <john@doe.com>\".

With prefix argument ARG, prompt for which mail address to use.

\(fn RECORDS &optional ARG)" t nil)

(autoload 'ebdb-info "ebdb-com" "\


\(fn)" t nil)

(autoload 'ebdb-help "ebdb-com" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "ebdb-format" "ebdb-format.el" (22935 37845
;;;;;;  0 0))
;;; Generated autoloads from ebdb-format.el

(autoload 'ebdb-format-to-tmp-buffer "ebdb-format" "\


\(fn &optional FORMATTER RECORDS)" t nil)

(autoload 'ebdb-format-all-records "ebdb-format" "\


\(fn &optional FORMATTER)" t nil)

;;;***

;;;### (autoloads nil "ebdb-gnus" "ebdb-gnus.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-gnus.el

(eieio-defclass-autoload 'ebdb-gnus-score-field '(ebdb-field-user) "ebdb-gnus" :human-readable)

(autoload 'ebdb/gnus-score "ebdb-gnus" "\
This returns a score alist for Gnus.  A score pair will be made for
every member of the mail field in records which also have a gnus-score
field.  This allows the EBDB to serve as a supplemental global score
file, with the advantage that it can keep up with multiple and changing
addresses better than the traditionally static global scorefile.

\(fn GROUP)" nil nil)

(eieio-defclass-autoload 'ebdb-gnus-imap-field '(ebdb-field-user) "ebdb-gnus" :human-readable)

;;;***

;;;### (autoloads nil "ebdb-i18n" "ebdb-i18n.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-i18n.el

(autoload 'ebdb-internationalize-addresses "ebdb-i18n" "\
Go through all the EBDB contacts and \"internationalize\"
  address fields.

Essentially this just means swapping out the string country names
for their symbol representations.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "ebdb-ispell" "ebdb-ispell.el" (22935 37845
;;;;;;  0 0))
;;; Generated autoloads from ebdb-ispell.el

(autoload 'ebdb-ispell-export "ebdb-ispell" "\
Export EBDB records to ispell personal dictionaries.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ebdb-migrate" "ebdb-migrate.el" (22935 37845
;;;;;;  0 0))
;;; Generated autoloads from ebdb-migrate.el

(autoload 'ebdb-migrate "ebdb-migrate" "\
Migrate the EBDB from the version on disk to the current version
\(in `ebdb-file-format').

\(fn RECORDS OLD-FORMAT)" nil nil)

(autoload 'ebdb-migrate-from-bbdb "ebdb-migrate" "\
Migrate from BBDB to EBDB.

This upgrade is extreme enough that we can't really use the
existing migration mechanisms.  They are still there, though, in
case someone's going from, say, version 2 to 4 in one jump.

Assume that the variable `bbdb-file' points to an existing file
holding valid contacts in a previous BBDB format.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "ebdb-mua" "ebdb-mua.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-mua.el

(autoload 'ebdb-update-records "ebdb-mua" "\
Find and possibly edit the records matching ADDRESS-LIST.

ADDRESS-LIST is a list of mail addresses.  (It can be extracted from
a mail message using `ebdb-get-address-components'.)
UPDATE-P may take the following values:
 existing     Find existing records matching ADDRESS.
 update       Search for existing records matching ADDRESS;
                update name and mail field if necessary.
 query        Search for existing records matching ADDRESS;
                query for creation of a new record if the record does not exist.
 create or t  Search for existing records matching ADDRESS;
                create a new record if it does not yet exist.
 nil          Do nothing.
 a function   This functions will be called with no arguments.
                It should return one of the above values.

If SORT is non-nil, sort records according to `ebdb-record-lessp'.
Otherwise, the records are ordered according to ADDRESS-LIST.

Usually this function is called by the wrapper `ebdb-mua-auto-update'.

\(fn ADDRESS-LIST &optional UPDATE-P SORT)" nil nil)

(autoload 'ebdb-mua-update-records "ebdb-mua" "\
Update all records associated with the message under point.

This command is meant for manually updating records when
`ebdb-mua-auto-update-p' is nil: it behaves as if that option
were set to 'query.  The rules of `ebdb-select-message' still
apply, however.

\(fn &optional HEADER-CLASS ALL)" t nil)

(autoload 'ebdb-mua-display-records "ebdb-mua" "\
Display the EBDB record(s) for the addresses in this message.

This looks into the headers of a message according to
HEADER-CLASS.  Then for the mail addresses found the
corresponding EBDB records are displayed.  Records are not
created or updated.

HEADER-CLASS is defined in `ebdb-message-headers'.  If it is nil,
use all classes in `ebdb-message-headers'.  If ALL is non-nil,
bind `ebdb-message-all-addresses' to ALL.

\(fn &optional HEADER-CLASS ALL)" t nil)

(autoload 'ebdb-mua-display-sender "ebdb-mua" "\
Display the EBDB record(s) for the sender of this message.

\(fn)" t nil)

(autoload 'ebdb-mua-display-recipients "ebdb-mua" "\
Display the EBDB record(s) for the recipients of this message.

\(fn)" t nil)

(autoload 'ebdb-mua-display-all-records "ebdb-mua" "\
Display the EBDB record(s) for all addresses in this message.

\(fn)" t nil)

(autoload 'ebdb-mua-display-all-recipients "ebdb-mua" "\
Display EBDB records for all recipients of this message.

\(fn)" t nil)

(autoload 'ebdb-mua-edit-sender-notes "ebdb-mua" "\
Edit the notes field of the EBDB record of the message sender.

\(fn)" t nil)

(autoload 'ebdb-mua-snarf-article "ebdb-mua" "\
Snarf the body of the current article.

This snarfs all available record information in the article,
first attempting to associate it with the senders and recipients
of the article, afterwards prompting for the creation of new
records.

In addition, if a signature is present, snarf it and attempt at
associate field information in it with the article sender.

With a prefix arg, only snarf the signature.

\(fn &optional ARG)" t nil)

(autoload 'ebdb-mua-auto-update "ebdb-mua" "\
Update EBDB automatically based on incoming and outgoing messages.

This looks into the headers of a message according to
HEADER-CLASS.  Then for the mail addresses found the
corresponding EBDB records are updated.  UPDATE-P determines
whether only existing EBDB records are taken or whether also new
records are created for these mail addresses.  Return matching
records.

HEADER-CLASS is defined in `ebdb-message-headers'.  If it is nil,
use all classes in `ebdb-message-headers'.  UPDATE-P may take the
same values as `ebdb-mua-auto-update-p'.  If UPDATE-P is nil, use
`ebdb-mua-auto-update-p' (which see).

If `ebdb-mua-pop-up' is non-nil, EBDB pops up the *EBDB* buffer
along with the MUA window(s), displaying the matching records.

\(fn &optional HEADER-CLASS UPDATE-P)" nil nil)

;;;***

;;;### (autoloads nil "ebdb-org" "ebdb-org.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-org.el

(eieio-defclass-autoload 'ebdb-org-field-tags '(ebdb-field-user) "ebdb-org" :human-readable)

;;;***

;;;### (autoloads nil "ebdb-pgp" "ebdb-pgp.el" (22935 37845 0 0))
;;; Generated autoloads from ebdb-pgp.el

(eieio-defclass-autoload 'ebdb-field-pgp '(ebdb-field-user) "ebdb-pgp" :documentation)

(autoload 'ebdb-pgp "ebdb-pgp" "\
Add PGP MML tags to a message according to the recipients' EBDB records.

Use it by adding a \"pgp action\" field to one or more records.

When sending a message to those records (ie, the records appear
in `ebdb-pgp-headers' headers), this grabs the action from their
`ebdb-field-pgp' field.  If multiple records propose different
actions, perform the action which appears first in
`ebdb-pgp-ranked-actions'.  If this proposes no action at all,
use `ebdb-pgp-default-action'.  The variable `ebdb-pgp-method'
defines the method which is actually used for signing and
encrypting.

This command works with both `mail-mode' and `message-mode' to send
signed or encrypted mail.

This file does not automatically set up hooks for signing and
encryption, see Info node `(message)Signing and encryption' for
reasons why.  Instead, you might want to call the command
`ebdb-pgp' manually, then call `mml-preview'.

If you do decide to set up automatic signing/encryption hooks,
use one of the following, as appropriate:

\(add-hook 'message-send-hook 'ebdb-pgp)
\(add-hook 'mail-send-hook 'ebdb-pgp)

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ebdb-snarf" "ebdb-snarf.el" (22935 37845 0
;;;;;;  0))
;;; Generated autoloads from ebdb-snarf.el

(autoload 'ebdb-snarf "ebdb-snarf" "\
Snarf text and attempt to display/update/create a record from it.

If STRING is given, snarf the string.  If START and END are given
in addition to STRING, assume they are 0-based indices into it.
If STRING is nil but START and END are given, assume they are
buffer positions, and snarf the region between.  If all three
arguments are nil, snarf the entire current buffer.

If RECORDS is present, it is a list of records that we assume may
be relevant to snarfed field data.

If RET is non-nil, return the records.  Otherwise display them.

\(fn &optional STRING START END RECS RET)" t nil)

;;;***

;;;### (autoloads nil nil ("ebdb-complete.el" "ebdb-i18n-test.el"
;;;;;;  "ebdb-message.el" "ebdb-mhe.el" "ebdb-pkg.el" "ebdb-rmail.el"
;;;;;;  "ebdb-test.el" "ebdb-vcard.el") (22935 37845 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ebdb-autoloads.el ends here
