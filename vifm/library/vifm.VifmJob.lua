---@meta

--Instances of this type are returned by |vifm-l_vifm.startjob()|.
---@class VifmJob
VifmJob = {}

--Waits for the job to finish.
--
--Raises an error:~ If waiting has failed.
function VifmJob:wait() end

--Retrieves exit code of the application.
--
--Return:~
--  Returns an integer number that represents exit code.  The value is `-x` if
--  the application was killed by signal `x`.  `-127` or `-128` means that
--  tracking the application has failed in some way.
--
--Raises an error: If waiting has failed.
--
---@return number
function VifmJob:exitcode() end

--Retrieves stream associated with standard input of a job.
--
--Return:~
--  Returns file stream from standard I/O library of Lua.
--
--Raises an error:~
--  If the job wasn't started with "w" I/O mode (see |vifm-l_vifm.startjob()|).
--  If input stream object is already closed.
function VifmJob:stdin() end

--Retrieves stream associated with standard output of a job.  Includes error
--stream if `mergestreams` was set to `true`.
--
--Return:~
--  Returns file stream from standard I/O library of Lua.
--
--Raises an error:~
--  If the job wasn't started with "r" I/O mode (see |vifm-l_vifm.startjob()|).
--  If output stream object is already closed.
function VifmJob:stdout() end

--Retrieves data collected from error stream of the job.  It's accumulated
--automatically in background and contains all data collected so far, the call
--doesn't wait for arrival of data.  Empty if `mergestreams` was set to `true`.
--
---@return string
function VifmJob:errors() end
